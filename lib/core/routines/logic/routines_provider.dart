import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';
import 'package:workout_timer/core/routine_step/logic/routine_step_state.dart';

import '../../routine/logic/routine_state.dart';
import 'routines_state.dart';

part 'routines_state_notifier.dart';

/// Provider to use the RoutinesStateNotifier
final routinesNotifierProvider =
    StateNotifierProvider<RoutinesNotifier, RoutinesState>((ref) {
  final loader = ref.watch(routinesLoaderProvider);

  return RoutinesNotifier(ref, loader);
});

/// Repositories Providers
final initialRoutineIdProvider = Provider<String>((ref) => 'test2');

final routinesLoaderProvider = Provider<RoutinesState>((ref) {
  // TODO load from a persistent store - for now static initialization
  const routine1 = RoutineState(id: 'test1', name: 'StopWatch', steps: [
    RoutineStepState(name: 'Time'),
  ]);

  const routine2 =
      RoutineState(id: 'test2', name: 'Countdown Stopwatch', steps: [
    RoutineStepState(
      name: 'Countdown',
      timer: StepTimer.countDownFrom,
      timeTo: Duration(seconds: 5),
    ),
    RoutineStepState(
      name: 'StopWatch',
      beginAction: BeginAction.beginImmediately,
    ),
  ]);

  return const RoutinesState(routines: [routine1, routine2]);
});


/// Use Cases Providers
/// TODO: Create Use Cases Providers