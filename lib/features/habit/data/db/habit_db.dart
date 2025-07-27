import 'package:habitroot/features/habit/domain/habit.dart';
import 'package:hive_ce/hive.dart';

class HabitDB {
  final Box<Habit> _box = Hive.box<Habit>('habits');

  List<Habit> getAllHabits() {
    return _box.values.toList();
  }

  Habit? getHabit(String id) {
    return _box.get(id);
  }

  Future<void> addHabit(Habit habit) async {
    await _box.put(habit.id, habit);
  }

  Future<void> deleteHabit(String id) async {
    await _box.delete(id);
  }

  Future<void> updateHabit(Habit habit) async {
    await _box.put(habit.id, habit);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
