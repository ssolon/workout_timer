import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';
import 'package:workout_timer/core/routine_step/logic/routine_step_state.dart';

import '../../routine/logic/routine_state.dart';
import 'routines_state.dart';

part 'routines_state_notifier.dart';

/// Provider to use the RoutinesStateNotifier
final routinesNotifierProvider =
    StateNotifierProvider<RoutinesNotifier, RoutinesState>(
        (ref) => RoutinesNotifier(ref));

/// Repositories Providers
/// TODO: Create Repositories Providers

/// Use Cases Providers
/// TODO: Create Use Cases Providers