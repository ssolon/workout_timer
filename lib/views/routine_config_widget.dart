import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';

import '../core/routine_step/logic/routine_step_state.dart';

class RoutineConfigWidget extends ConsumerWidget with UiLoggy {
  const RoutineConfigWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = ref.watch(routineNotifierProvider);
    final steps = routine.maybeMap((value) => value.steps,
        orElse: () => List<RoutineStepState>.empty());

    int stepNumber = 0;

    return Column(
      children: [
        for (final s in steps)
          ExpansionTile(
              leading: Text("#${++stepNumber}"),
              title: Text(s.name),
              subtitle: (s.description != null) ? Text(s.description!) : null,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<BeginAction>(
                    value: s.beginAction,
                    items: [
                      for (final i in BeginAction.values)
                        DropdownMenuItem(value: i, child: Text(i.name))
                    ],
                    onChanged: (newAction) {
                      if (newAction != null) {
                        ref
                            .read(routineNotifierProvider.notifier)
                            .setStepBeginAction(stepNumber, newAction);
                      }
                    }),
                Row(
                  children: [
                    DropdownButton<StepTimer>(
                      value: s.timer,
                      onChanged: (newTimer) {
                        if (newTimer != null) {
                          ref
                              .read(routineNotifierProvider.notifier)
                              .setStepTimer(stepNumber, newTimer);
                        }
                      },
                      items: [
                        for (final i in StepTimer.values)
                          DropdownMenuItem(value: i, child: Text(i.name)),
                      ],
                    ),
                    Visibility(
                      visible: [StepTimer.countDownFrom, StepTimer.countUpTo]
                          .contains(s.timer),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => loggy.debug("!!!! Duration tap"),
                          child: Text(
                              textAlign: TextAlign.end,
                              textScaleFactor: 1.25,
                              (s.timeTo ?? const Duration())
                                  .toString()
                                  .split('.')
                                  .first
                                  .padLeft(8, "0")),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
      ],
    );
  }
}
