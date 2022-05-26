part of 'routine_step_provider.dart';

/// Defines all the Step logic the app will use
class StepNotifier extends StateNotifier<RoutineStepState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  StepNotifier() : super(const RoutineStepState(name: 'Step'));
}
