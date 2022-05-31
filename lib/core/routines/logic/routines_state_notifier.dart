part of 'routines_provider.dart';

/// Defines all the Routines logic the app will use
class RoutinesNotifier extends StateNotifier<RoutinesState> with UiLoggy {
  final Ref ref;
  bool dirty = false;

  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutinesNotifier(this.ref, RoutinesState starting) : super(starting) {
    // Update our state when the current routine is changed
    ref.listen(routineNotifierProvider,
        (RoutineState? oldRoutine, RoutineState newRoutine) {
      updateRoutine(newRoutine);
    });
  }

  /// Set the current routine using [newCurrentId]
  RoutineState? setCurrent(String? newCurrentId) {
    final newCurrent = routineById(newCurrentId);
    if (newCurrent != null) {
      ref.read(routineNotifierProvider.notifier).setRoutine(newCurrent);
    }
    return newCurrent;
  }

  /// Find a routine, if any, by [routineId]
  RoutineState? routineById(String? routineId) {
    return routineId == null
        ? null
        : state.mapOrNull((value) => value.routines.firstWhere(
            (element) => element.mapOrNull((value) => value.id) == routineId));
  }

  /// Return true if [checkRoutine] has changed (or is new)
  bool routineChanged(RoutineState checkRoutine) {
    final currentRoutine = routineById(idOf(checkRoutine));
    return currentRoutine == null || currentRoutine != checkRoutine;
  }

  /// Update, or add, [updatedRoutine] if it's new or has changed
  void updateRoutine(RoutineState updatedRoutine) {
    // Ignore setting routine to unchanged routine
    if (!routineChanged(updatedRoutine)) {
      return;
    }

    final updatedId = idOf(updatedRoutine);
    final routines = state.mapOrNull(
          (value) => value.routines,
        ) ??
        [];

    final newRoutines = <RoutineState>[];
    bool isNew = true; // If we don't find one

    // Replace with updated if existing
    for (final r in routines) {
      if (idOf(r) == updatedId) {
        newRoutines.add(updatedRoutine);
        isNew = false;
      } else {
        newRoutines.add(r);
      }
    }

    // Add if new
    if (isNew) {
      newRoutines.add(updatedRoutine);
    }

    final newState = state.map(
      (data) => data.copyWith(routines: newRoutines),
      initial: (initial) => RoutinesState(routines: newRoutines),
      loading: (loading) => null,
      error: (message) => null,
    );

    if (newState != null) {
      dirty = true;
      state = newState;
    }
  }

  static String? idOf(RoutineState routine) => routine.mapOrNull(
        (value) => value.id,
      );
}
