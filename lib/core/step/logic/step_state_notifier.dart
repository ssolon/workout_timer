part of 'step_provider.dart';

/// Defines all the Step logic the app will use
class StepNotifier extends StateNotifier<StepState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  StepNotifier() : super(const StepState(name: 'Step'));
}
