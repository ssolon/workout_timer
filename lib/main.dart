import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

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
  final notifier = TimerNotifier();

  /// We need to cleanup the timer. Should we have a separte 'dispose'?
  ref.onDispose(() => notifier.reset());

  return notifier;
});

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TimerDisplayWidget(),
          ],
        ),
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

    loggy.debug("BottomSheet running=$running");

    return Row(children: [
      Expanded(
          child: TextButton(
              style: _commandButtonStyle(
                  context, running ? Colors.red : Colors.grey),
              onPressed: status == TimerStatus.running
                  ? () => ref.read(timerNotifierProvider.notifier).pause()
                  : null,
              child: const Text('-'))),
      Expanded(
          child: TextButton(
              style: _commandButtonStyle(context, Colors.yellow),
              onPressed: () => ref.read(timerNotifierProvider.notifier).reset(),
              child: const Text('Reset'))),
      Expanded(
          child: TextButton(
              style: _commandButtonStyle(
                  context, running ? Colors.grey : Colors.green),
              onPressed: status == TimerStatus.stopped
                  ? () => ref.read(timerNotifierProvider.notifier).start()
                  : null,
              child: const Text('+'))),
    ]);
  }

  ButtonStyle _commandButtonStyle(BuildContext context, Color color) {
    return TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: color,
        textStyle: Theme.of(context).textTheme.headlineSmall);
  }
}

class TimerDisplayWidget extends ConsumerWidget with UiLoggy {
  const TimerDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerNotifierProvider);
    loggy.debug("status=${timer.status}");
    return Text(
      formatDuration(timer.current),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

/// A general format for duration which doesn't display leading zeros.
String formatDuration(Duration duration) {
  final days = duration.inDays;
  final lessDays = duration - Duration(days: days);

  final hours = lessDays.inHours;
  final lessHours = lessDays - Duration(hours: hours);

  final minutes = lessHours.inMinutes;
  final lessMinutes = lessHours - Duration(minutes: minutes);

  final seconds = lessMinutes.inSeconds;
  final lessSeconds = lessMinutes - Duration(seconds: seconds);

  final millis = lessSeconds.inMilliseconds;

  String result = millis > 0 ? ".$millis" : "";
  if (hours > 0 || minutes > 0) {
    result = seconds.toString().padLeft(2, '0') + result;
  } else {
    result = seconds.toString() + result;
  }

  if (hours > 0) {
    result = hours.toString() +
        ':' +
        minutes.toString().padLeft(2, '0') +
        ':' +
        result;
  } else if (minutes > 0) {
    result = minutes.toString() + ':' + result;
  }

  return result;
}
