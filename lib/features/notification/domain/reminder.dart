import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/enum/weekday.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'ReminderAdapter')
abstract class Reminder with _$Reminder {
  const factory Reminder({
    @HiveField(0) required String id,
    @HiveField(1) required String habitId,
    @HiveField(2) required String time,
    @HiveField(3) @Default(<Weekday>[]) List<Weekday> days,
    @HiveField(4) @Default(false) bool isEnabled,
  }) = _Reminder;

  const Reminder._();

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);
}
