import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_provider.dart';
import 'package:workout_timer/views/routine_config_widget.dart';
import 'package:workout_timer/views/sound_config.dart';

import 'core/sound/sfx.dart';
import 'views/routine_selector_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());
  player = AudioCache(
      prefix: 'assets/sounds/',
      fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY));
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends ConsumerStatefulWidget with UiLoggy {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends ConsumerState<MyHomePage> with UiLoggy {
  @override
  void initState() {
    super.initState();
    player?.loadAll([
      for (final v in AudioEffect.values) v.fileName
    ]).whenComplete(() => loggy.debug('!!! sound files loaded'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const RoutineSelectorWidget(),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const TimerDisplayWidget(),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Routines',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: const [
                  Expanded(
                    child: RoutineSelectorWidget(),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.save),
                  ),
                ],
              ),
              const RoutineConfigWidget(),
              const SoundConfigurationWidget(),
            ]),
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
                ? () {
                    if (ref.read(soundSettingsNotifierProvider).stop) {
                      ref.read(soundPlayerProvider).playStop();
                    }
                    ref.read(timerNotifierProvider.notifier).pause();
                  }
                : null,
            child: const Icon(Icons.pause)),
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: _commandButtonStyle(
                context, running ? Colors.grey : Colors.yellow),
            onPressed: !running
                ? () {
                    if (ref.read(soundSettingsNotifierProvider).reset) {
                      ref.read(soundPlayerProvider).playReset();
                    }
                    ref.read(timerNotifierProvider.notifier).reset();
                  }
                : null,
            child: const Icon(Icons.check)),
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: _commandButtonStyle(
                context, running ? Colors.blue : Colors.green),
            onPressed: !running
                ? () {
                    if (ref.read(soundSettingsNotifierProvider).start) {
                      ref.read(soundPlayerProvider).playStart();
                    }
                    ref.read(timerNotifierProvider.notifier).start();
                  }
                : null,
            child: running
                ? const Icon(Icons.timelapse)
                : const Icon(Icons.play_arrow)),
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
  const TimerDisplayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerNotifierProvider);
    final baseStyle = Theme.of(context).textTheme.headline2;
    final counterStyle = Platform.isIOS
        ? baseStyle?.copyWith(fontFamily: "Helvetica Neue")
        : baseStyle;

    ref.listen(timerNotifierProvider.select((value) => value.current.inSeconds),
        ((int? previous, int? next) {
      final settings = ref.read(soundSettingsNotifierProvider);
      if (state.status == TimerStatus.running) {
        if (next != null) {
          if (settings.beep && settings.beepEvery.playIt(next)) {
            ref.read(soundPlayerProvider).playBeep();
          } else if (settings.tick && settings.tickEvery.playIt(next)) {
            ref.read(soundPlayerProvider).playTick();
          }
        }
      }
    }));

    return Text(
      formatDuration(state.current),
      style: counterStyle,
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
