import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_state.freezed.dart';

/// Routine consists of a number of steps to be executed.
@freezed
abstract class RoutineState with _$RoutineState {
  /// Data is present state
  const factory RoutineState({
    required String name,
    String? description,
  }) = Data;

  /// Initial/default state
  const factory RoutineState.initial() = Initial;

  /// Data is loading state
  const factory RoutineState.loading() = Loading;

  /// Error when loading data state
  const factory RoutineState.error([String? message]) = Error;
}
