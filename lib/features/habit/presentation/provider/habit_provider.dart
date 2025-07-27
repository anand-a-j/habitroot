import 'package:habitroot/features/habit/data/db/habit_db.dart';
import 'package:habitroot/features/habit/domain/habit.dart';
import 'package:riverpod/riverpod.dart';

// Provider for accessing the habit database
final _habitDBProvider = Provider<HabitDB>((ref) => HabitDB());

// Main habit provider using a map keyed by habit ID
final habitProvider =
    StateNotifierProvider<HabitNotifier, Map<String, Habit>>((ref) {
  final db = ref.read(_habitDBProvider);
  final habits = db.getAllHabits();
  return HabitNotifier(db, {for (var h in habits) h.id: h});
});

// Provider to get a specific habit by ID
final habitByIdProvider = Provider.family<Habit, String>((ref, id) {
  return ref.watch(habitProvider)[id]!;
});

// StateNotifier for managing habits
class HabitNotifier extends StateNotifier<Map<String, Habit>> {
  final HabitDB db;

  HabitNotifier(this.db, Map<String, Habit> initialState) : super(initialState);

  void addHabit(Habit habit) async {
    // Get current max order from existing habits
    final maxOrder = state.isEmpty
        ? 0
        : state.values.map((h) => h.order).reduce((a, b) => a > b ? a : b);

    // Assign order as max + 1
    final newHabit = habit.copyWith(order: maxOrder + 1);

    // Add to DB and update state
    await db.addHabit(newHabit);
    state = {
      ...state,
      newHabit.id: newHabit,
    };
  }

  void deleteHabit(String id) async {
    await db.deleteHabit(id);
    final newState = Map.of(state);
    newState.remove(id);
    state = newState;
  }

  void updateHabit(Habit updatedHabit) async {
    await db.updateHabit(updatedHabit);
    state = {
      ...state,
      updatedHabit.id: updatedHabit,
    };
  }

  void reloadHabits() {
    final allHabits = db.getAllHabits();
    state = {for (var h in allHabits) h.id: h};
  }

  void reorderHabits(
    List<Habit> currentList,
    int oldIndex,
    int newIndex,
  ) async {
    if (newIndex > oldIndex) newIndex -= 1;

    final updatedList = [...currentList];
    final movedHabit = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, movedHabit);

    // Update each habit's order
    for (int i = 0; i < updatedList.length; i++) {
      final updated = updatedList[i].copyWith(order: i);
      await db.updateHabit(updated);
      state[updated.id] = updated;
    }

    // Force update to state
    state = {...state};
  }
}
