import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../routine_step/logic/routine_step_state.dart';
import 'routine_state.dart';

part 'routine_state_notifier.dart';

/// Provider to use the RoutineStateNotifier
final routineNotifierProvider =
    StateNotifierProvider<RoutineNotifier, RoutineState>(
  (ref) => RoutineNotifier(),
);

/// Repositories Providers
/// TODO: Create Repositories Providers

/// Use Cases Providers
/// TODO: Create Use Cases Providers