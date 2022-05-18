import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routine_state.dart';

part 'routine_state_notifier.dart';

/// Provider to use the RoutineStateNotifier
final routineNotifierProvider = StateNotifierProvider(
  (ref) => RoutineNotifier(),
);

/// Repositories Providers
/// TODO: Create Repositories Providers

/// Use Cases Providers
/// TODO: Create Use Cases Providers