import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_timer/core/step/logic/step_state.dart';

part 'routine_state.freezed.dart';

/// Routine consists of a number of steps to be executed.
@freezed
abstract class RoutineState with _$RoutineState {
  /// Data is present state
  const factory RoutineState({
    required String name,
    String? description,
    required List<RoutineStepState> steps,
  }) = Data;

  /// Initial/default state
  const factory RoutineState.initial() = Initial;

  /// Data is loading state
  const factory RoutineState.loading() = Loading;

  /// Error when loading data state
  const factory RoutineState.error([String? message]) = Error;
}
