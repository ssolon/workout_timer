import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routine_step_state.dart';

part 'routine_step_state_notifier.dart';

/// Provider to use the StepStateNotifier
final stepNotifierProvider = StateNotifierProvider(
  (ref) => StepNotifier(),
);

/// Repositories Providers
/// TODO: Create Repositories Providers

/// Use Cases Providers
/// TODO: Create Use Cases Providers