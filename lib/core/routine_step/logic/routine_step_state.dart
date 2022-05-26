import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_state.freezed.dart';

enum StepTimer {
  countUp,
  countUpTo,
  countDownFrom,
}

enum BeginAction {
  waitForStartCommand,
  beginImmediately,
}

@freezed
abstract class RoutineStepState with _$RoutineStepState {
  const factory RoutineStepState({
    required String name,
    String? description,
    @Default(BeginAction.waitForStartCommand) BeginAction beginAction,
    @Default(StepTimer.countUp) StepTimer timer,
  }) = _StepState;
}
