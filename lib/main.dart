import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:soundpool/soundpool.dart';
import 'package:workout_timer/views/beep_config.dart';

void main() {
  Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());
  runApp(const ProviderScope(child: MyApp()));
}

enum TimerStatus { stopped, running }

@immutable
class TimerState {
  final TimerStatus status;
  final Duration current;

  const TimerState({required this.status, required this.current});

  TimerState copyWith({TimerStatus? status, Duration? current}) {
    return TimerState(
        status: status ?? this.status, current: current ?? this.current);
  }
}

class TimerNotifier extends StateNotifier<TimerState> with UiLoggy {
  TimerNotifier([this.tick = const Duration(seconds: 1)])
      : super(
            const TimerState(status: TimerStatus.stopped, current: Duration()));

  TimerStatus status = TimerStatus.stopped;
  Duration tick;

  Duration current = const Duration();
  StreamSubscription<int>? _tickerSubscription;

  void start() {
    if (status == TimerStatus.stopped) {
      status = TimerStatus.running;
      final started = current;
      _tickerSubscription = Stream.periodic(tick, (i) => i).listen((event) {
        current = started + tick * event;
        state = _currentState();
      });
    }
  }

  void pause() async {
    if (status == TimerStatus.running) {
      status = TimerStatus.stopped;
      _tickerSubscription?.cancel();
      state = _currentState();
    }
  }

  void reset() {
    if (status == TimerStatus.running) {
      pause();
    }
    current = Duration.zero;
    state = _currentState();
  }

  _currentState() => TimerState(current: current, status: status);
}

final timerNotifierProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, TimerState>((ref) {
  final notifier = TimerNotifier(const Duration(milliseconds: 100));

  // We need to cleanup the timer. Should we have a separate 'dispose'?
  ref.onDispose(() => notifier.reset());

  return notifier;
});

final soundPool = Provider(((ref) => Soundpool.fromOptions()));

final tickSound = FutureProvider<int>((ref) async {
  return rootBundle.load("assets/sounds/tap.wav").then((ByteData soundData) {
    return ref.read(soundPool).load(soundData);
  });
});

class SoundPlayer {
  ProviderRef ref;
  int soundId;

  SoundPlayer(this.ref, this.soundId);

  void play() async {
    await ref.read(soundPool).play(soundId);
  }
}

final soundPlayerProvider = Provider((ref) async {
  final sound = ref.watch(tickSound);

  return sound.whenData((value) => SoundPlayer(ref, value));
});

// final playTick = StateProvider<int>((ref) {
//   final soundProvider = ref.watch(tickSound);

//   return ref.read(soundPool).play(soundProvider.value!);
// });

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Workout Timer'),
    );
  }
}

class MyHomePage extends ConsumerWidget with UiLoggy {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(soundPlayerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TimerDisplayWidget(),
            IconButton(
                onPressed: () => player
                    .then((value) => value.whenData((value) => value.play())),
                icon: const Icon(Icons.speaker)),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Default',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.save),
                        ),
                      ],
                    ),
                    BeepConfigurationWidget()
                  ]),
            ),
          ),
        ]),
      ),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}

class BottomSheetWidget extends ConsumerWidget with UiLoggy {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status =
        ref.watch(timerNotifierProvider.select((value) => value.status));
    final running = status == TimerStatus.running;

    return Row(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: _commandButtonStyle(
                context, running ? Colors.red : Colors.grey),
            onPressed: running
                ? () => ref.read(timerNotifierProvider.notifier).pause()
                : null,
            child: const Text('-')),
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: _commandButtonStyle(
                context, running ? Colors.grey : Colors.yellow),
            onPressed: !running
                ? () => ref.read(timerNotifierProvider.notifier).reset()
                : null,
            child: const Text('Reset')),
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: _commandButtonStyle(
                context, running ? Colors.grey : Colors.green),
            onPressed: !running
                ? () => ref.read(timerNotifierProvider.notifier).start()
                : null,
            child: const Text('+')),
      )),
    ]);
  }

  _commandButtonStyle(BuildContext context, Color color) {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.headlineSmall!));
  }
}

class TimerDisplayWidget extends ConsumerWidget with UiLoggy {
  const TimerDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerNotifierProvider);

    return Text(
      formatDuration(state.current),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

/// A general format for duration which doesn't display leading zeros.
String formatDuration(
  Duration duration,
) {
  final days = duration.inDays;
  final lessDays = duration - Duration(days: days);

  final hours = lessDays.inHours;
  final lessHours = lessDays - Duration(hours: hours);

  final minutes = lessHours.inMinutes;
  final lessMinutes = lessHours - Duration(minutes: minutes);

  final seconds = lessMinutes.inSeconds;
  final lessSeconds = lessMinutes - Duration(seconds: seconds);

  final tenths = (lessSeconds.inMilliseconds / 100).round();

  String result = ".$tenths";
  if (hours > 0 || minutes > 0) {
    result = seconds.toString().padLeft(2, '0') + result;
  } else {
    result = seconds.toString() + result;
  }

  if (hours > 0) {
    result = '$hours:${minutes.toString().padLeft(2, '0')}:$result';
  } else if (minutes > 0) {
    result = '$minutes:$result';
  }

  return result;
}
