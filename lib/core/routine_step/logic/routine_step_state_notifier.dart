part of 'routine_step_provider.dart';

/// Defines all the Step logic the app will use
class StepNotifier extends StateNotifier<RoutineStepState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  StepNotifier() : super(const RoutineStepState(name: 'Step'));

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }

  void setDescription(String newDescription) {
    state = state.copyWith(description: newDescription);
  }

  void setBeginAction(BeginAction newBeginAction) {
    state = state.copyWith(beginAction: newBeginAction);
  }

  void setTimer(StepTimer newTimer) {
    state = state.copyWith(timer: newTimer);
  }

  void setTimeTo(Duration newTimeTo) {
    state = state.copyWith(timeTo: newTimeTo);
  }
}
