part of 'routines_provider.dart';

/// Defines all the Routines logic the app will use
class RoutinesNotifier extends StateNotifier<RoutinesState> {
  final Ref ref;

  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutinesNotifier(this.ref) : super(const RoutinesState.initial()) {
    const routines = [
      RoutineState(name: 'StopWatch', steps: [
        RoutineStepState(name: 'Time'),
      ]),
      RoutineState(name: 'Countdown Stopwatch', steps: [
        RoutineStepState(name: 'Countdown'),
        RoutineStepState(
            name: 'StopWatch', beginAction: BeginAction.beginImmediately),
      ])
    ];

    state = const RoutinesState(routines: routines);
    setCurrent(routines[0]);
  }

  RoutineState? get() => state.whenOrNull((current, routines) => current!);

  void setCurrent(RoutineState? newCurrent) {
    state = state.mapOrNull((value) => value.copyWith(current: newCurrent))
        as RoutinesState;

    if (newCurrent != null) {
      ref.read(routineNotifierProvider.notifier).setRoutine(newCurrent);
    }
  }
}
