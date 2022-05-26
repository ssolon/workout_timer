import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';

import '../core/routine_step/logic/routine_step_state.dart';

class RoutineConfigWidget extends ConsumerWidget {
  const RoutineConfigWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = ref.watch(routineNotifierProvider);
    final steps = routine.maybeMap((value) => value.steps,
        orElse: () => List<RoutineStepState>.empty());

    int stepNumber = 1;

    return Column(
      children: [
        for (final s in steps)
          ExpansionTile(
              leading: Text("#${stepNumber++}"),
              title: Text(s.name),
              subtitle: (s.description != null) ? Text(s.description!) : null,
              children: [
                DropdownButton<BeginAction>(
                    value: s.beginAction,
                    items: [
                      for (final i in BeginAction.values)
                        DropdownMenuItem(value: i, child: Text(i.name))
                    ],
                    onChanged: (value) {})
              ]),
      ],
    );
  }
}
