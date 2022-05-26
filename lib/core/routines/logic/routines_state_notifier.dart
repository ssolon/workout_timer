part of 'routines_provider.dart';
// TODO: Implement Routines StateNotifier

/// Defines all the Routines logic the app will use
class RoutinesNotifier extends StateNotifier<RoutinesState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutinesNotifier()
      : super(const RoutinesState(routines: [
          RoutineState(name: 'StopWatch', steps: [
            StepState(name: 'Time'),
          ]),
          RoutineState(name: 'Countdown Stopwatch', steps: [
            StepState(name: 'Countdown'),
            StepState(name: 'StopWatch'),
          ]),
        ]));
}
