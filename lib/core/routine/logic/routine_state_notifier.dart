part of 'routine_provider.dart';

/// Defines all the Routine logic the app will use
class RoutineNotifier extends StateNotifier<RoutineState> with UiLoggy {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutineNotifier() : super(const RoutineState.initial()) {
    loggy.debug("CTOR");
  }

  void setRoutine(RoutineState newState) {
    state = newState;
  }

  void setName(String newName) {
    state.mapOrNull((value) {
      state = value.copyWith(name: newName);
    });
  }

  void setDescription(String newDescription) {
    state.mapOrNull((value) {
      state = value.copyWith(description: newDescription);
    });
  }

  void setStepName(int stepNumber, String newName) {
    state.mapOrNull((value) {
      final steps = value.steps;
      steps[stepNumber] = steps[stepNumber].copyWith(name: newName);
      state = value.copyWith(steps: steps);
    });
  }

  /// Update [beginAction] in step [stepNumber] (base 1).
  void setStepBeginAction(int stepNumber, BeginAction newAction) {
    _updateStep(stepNumber, (p0) => p0.copyWith(beginAction: newAction));
  }

  void setStepTimer(int stepNumber, StepTimer newTimer) {
    _updateStep(stepNumber, (p0) => p0.copyWith(timer: newTimer));
  }

  /// Update step [stepNumber] (one based) using the function which will assign
  /// a new value to the step passed (with copyWith) and return a new
  /// RoutineStepState.
  _updateStep(
      int stepNumber, RoutineStepState Function(RoutineStepState) updateValue) {
    state.mapOrNull((routine) {
      // Copy to make modifiable list
      final steps = List<RoutineStepState>.from(routine.steps);
      steps[stepNumber - 1] = updateValue(steps[stepNumber - 1]);
      state = routine.copyWith(steps: steps);
    });
  }
}
