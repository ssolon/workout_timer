import 'package:freezed_annotation/freezed_annotation.dart';

import '../../routine/logic/routine_state.dart';

part 'routines_state.freezed.dart';

/// TODO: Run build_runner command to generate freezed code
@freezed
abstract class RoutinesState with _$RoutinesState {
  /// Data is present state
  const factory RoutinesState(
      {RoutineState? current, @Default([]) List<RoutineState> routines}) = Data;

  /// Initial/default state
  const factory RoutinesState.initial() = Initial;

  /// Data is loading state
  const factory RoutinesState.loading() = Loading;

  /// Error when loading data state
  const factory RoutinesState.error([String? message]) = Error;
}
