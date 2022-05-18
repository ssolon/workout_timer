part of 'routine_provider.dart';
// TODO: Implement Routine StateNotifier

/// Defines all the Routine logic the app will use
class RoutineNotifier extends StateNotifier<RoutineState> {
  /// Base constructor expects StateNotifier use_cases to 
  /// read its usecases and also defines inital state
  RoutineNotifier() : super(RoutineState.initial());
}