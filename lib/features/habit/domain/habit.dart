import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../notification/domain/reminder.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: 'HabitAdapter')
abstract class Habit with _$Habit {
  const factory Habit({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? description,
    @HiveField(3) required int color,
    @HiveField(4) required String icon,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) DateTime? lastCompleted,
    @HiveField(7) @Default(0) int streak,
    @HiveField(8) @Default(false) bool isArchived,
    @HiveField(9) @Default(<DateTime>[]) List<DateTime> completedDates,
    @HiveField(10) @Default(0) int order,
    @HiveField(11) Reminder? reminder,
  }) = _Habit;

  const Habit._();

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
