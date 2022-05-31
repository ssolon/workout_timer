import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
