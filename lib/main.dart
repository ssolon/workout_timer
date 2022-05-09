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
    current = Duration();
    state = _currentState();
  }

  _currentState() => TimerState(current: current, status: status);
}

final counterProvider = StateProvider<int>((ref) => 0);
final timerNotifierProvider =
    StateNotifierProvider<TimerNotifier, TimerState>((ref) => TimerNotifier());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Timer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
            CounterDisplayWidget(),
          ],
        ),
      ),
      bottomSheet: Row(children: [
        Expanded(
            child: TextButton(
                style: _commandButtonStyle(context, Colors.red),
                onPressed: () =>
                    ref.read(timerNotifierProvider.notifier).pause(),
                child: const Text('-'))),
        Expanded(
            child: TextButton(
                style: _commandButtonStyle(context, Colors.yellow),
                onPressed: () =>
                    ref.read(timerNotifierProvider.notifier).reset(),
                child: const Text('Reset'))),
        Expanded(
            child: TextButton(
                style: _commandButtonStyle(context, Colors.green),
                onPressed: () =>
                    ref.read(timerNotifierProvider.notifier).start(),
                child: const Text('+'))),
      ]),
    );
  }

  ButtonStyle _commandButtonStyle(BuildContext context, Color color) {
    return TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: color,
        textStyle: Theme.of(context).textTheme.headlineSmall);
  }
}

class CounterDisplayWidget extends ConsumerWidget {
  const CounterDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerNotifierProvider);

    return Text(
      timer.current.toString(),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
