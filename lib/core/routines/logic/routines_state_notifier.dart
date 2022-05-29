part of 'routines_provider.dart';

/// Defines all the Routines logic the app will use
class RoutinesNotifier extends StateNotifier<RoutinesState> with UiLoggy {
  final Ref ref;
  bool dirty = false;

  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  RoutinesNotifier(this.ref, RoutinesState starting) : super(starting) {
    ref.listen(routinesInitialRoutineIdProvider, fireImmediately: true,
        (String? oldId, String? newId) {
      setCurrent(newId);
    });

    // Update our state when the current routine is changed
    ref.listen(routineNotifierProvider,
        (RoutineState? oldRoutine, RoutineState newRoutine) {
      updateRoutine(newRoutine);
    });
  }

  void setCurrent(String? newCurrentId) {
    final newCurrent = routineById(newCurrentId);
    if (newCurrent != null) {
      ref.read(routineNotifierProvider.notifier).setRoutine(newCurrent);
    }
  }

  RoutineState? routineById(String? routineId) {
    return routineId == null
        ? null
        : state.mapOrNull((value) => value.routines.firstWhere(
            (element) => element.mapOrNull((value) => value.id) == routineId));
  }

  void updateRoutine(RoutineState updatedRoutine) {
    final updatedId = idOf(updatedRoutine);
    final routines = state.mapOrNull(
          (value) => value.routines,
        ) ??
        [];

    final newRoutines = <RoutineState>[];
    bool isNew = true; // If we don't find one

    for (final r in routines) {
      if (idOf(r) == updatedId) {
        newRoutines.add(updatedRoutine);
        isNew = false;
      } else {
        newRoutines.add(r);
      }
    }

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
