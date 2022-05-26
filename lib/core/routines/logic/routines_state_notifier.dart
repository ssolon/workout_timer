part of 'routines_provider.dart';

/// Defines all the Routines logic the app will use
class RoutinesNotifier extends StateNotifier<RoutinesState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutinesNotifier() : super(const RoutinesState.initial()) {
    const routines = [
      RoutineState(name: 'StopWatch', steps: [
        StepState(name: 'Time'),
      ]),
      RoutineState(name: 'Countdown Stopwatch', steps: [
        StepState(name: 'Countdown'),
        StepState(name: 'StopWatch'),
      ])
    ];
    state = RoutinesState(routines: routines, current: routines[0]);
  }

  RoutineState? get() => state.whenOrNull((current, routines) => current!);

  void setCurrent(RoutineState? newCurrent) {
    state = state.mapOrNull((value) => value.copyWith(current: newCurrent))
        as RoutinesState;
  }
}
