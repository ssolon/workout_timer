import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';

import '../core/step/logic/step_state.dart';

class RoutineConfigWidget extends ConsumerWidget {
  const RoutineConfigWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = ref.watch(routineNotifierProvider);
    final steps = routine.maybeMap((value) => value.steps,
        orElse: () => List<RoutineStepState>.empty());

    int stepNumber = 1;

    return Column(
      children: [for (final s in steps) Text("${stepNumber++}. ${s.name}")],
    );
  }
}
