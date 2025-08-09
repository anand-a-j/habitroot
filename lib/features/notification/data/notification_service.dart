import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habitroot/features/habit/domain/habit.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings =
        InitializationSettings(android: androidSettings, iOS: null);

    await _notifications.initialize(settings);
  }

  static Future<bool> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      // Android 13+ requires POST_NOTIFICATIONS permission
      if (await Permission.notification.isGranted) return true;
      final status = await Permission.notification.request();
      return status.isGranted;
    }

    return false;
  }

  static Future<void> showTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Channel for testing notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    await _notifications.show(
      0, // Notification ID
      'Test Notification',
      'This is a local push notification',
      const NotificationDetails(android: androidDetails, iOS: null),
    );
  }

  Future<void> scheduleWeekdayReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required List<int> weekdays,
  }) async {
    for (var weekday in weekdays) {
      await _notifications.zonedSchedule(
        _generateWeekdayId(id, weekday),
        title,
        body,
        _nextInstanceOfWeekdayTime(hour, minute, weekday),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'habit_channel_id',
            'Habit Reminders',
            channelDescription: 'Reminders for habits',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    }
  }

  Future<void> updateHabitReminder({
    required Habit habit,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required List<int> weekdays,
  }) async {
    for (var weekday in habit.reminder?.days ?? []) {
      await _notifications.cancel(
        _generateWeekdayId(int.parse(habit.id), weekday),
      );
    }

    await scheduleWeekdayReminder(
      id: int.parse(habit.id),
      title: habit.name,
      body: body,
      hour: hour,
      minute: minute,
      weekdays: weekdays,
    );
  }

  int _generateWeekdayId(int habitId, int weekday) {
    return habitId * 10 + weekday;
  }

  tz.TZDateTime _nextInstanceOfWeekdayTime(int hour, int minute, int weekday) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> cancelReminder(int id) async {
    await _notifications.cancel(id);
  }
}
