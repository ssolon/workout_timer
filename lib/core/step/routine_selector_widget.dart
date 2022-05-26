import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../routine/logic/routine_state.dart';
import '../routines/logic/routines_provider.dart';

class RoutineSelectorWidget extends ConsumerWidget {
  const RoutineSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(routinesNotifierProvider);
    final textStyle = Theme.of(context).textTheme.headlineSmall;

    // Initialize current
    return routines.maybeWhen(
        (currentRoutine, routineList) => DropdownButton<RoutineState>(
              onChanged: (value) {
                ref.read(routinesNotifierProvider.notifier).setCurrent(value);
              },
              value: currentRoutine,
              items: [
                for (final r in routineList)
                  DropdownMenuItem(
                      value: r,
                      child: Text(
                        r.maybeMap((value) => value.name, orElse: () => '????'),
                        style: textStyle,
                      )),
              ],
            ),
        orElse: () => const Text('No routines defined!'));
  }
}
