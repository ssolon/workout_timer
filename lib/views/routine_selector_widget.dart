import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_timer/core/routine/logic/routine_provider.dart';

import '../core/routine/logic/routine_state.dart';
import '../core/routines/logic/routines_provider.dart';

class RoutineSelectorWidget extends ConsumerWidget {
  const RoutineSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(routinesNotifierProvider);
    final textStyle = Theme.of(context).textTheme.headline6;

    // Initialize current

    return routines.maybeWhen(
        (routineList) => DropdownButton<String>(
              isExpanded: true,
              itemHeight: null,
              onChanged: (value) {
                ref.read(routinesNotifierProvider.notifier).setCurrent(value);
              },
              value: ref
                  .read(routineNotifierProvider)
                  .mapOrNull((value) => value.id),
              items: [
                for (final r in routineList) _makeMenuItem(r, textStyle),
              ],
            ),
        orElse: () => const Text('No routines defined!'));
  }

  _makeMenuItem(RoutineState routine, textStyle) {
    final routineData = routine.mapOrNull((value) => value);
    return DropdownMenuItem(
      value: routineData?.id,
      child: Text(
        routineData?.name ?? '????',
        style: textStyle,
      ),
    );
  }
}
