import 'package:flutter/material.dart' show TimeOfDay;
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool isSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  DateTime addDays(int days) {
    return DateTime(year, month, day + days);
  }

  /// Date Formats--------------------------------------------------------------

  /// Su Mo Tu...
  String get formatToTwoLetterWeekday {
    String fullDayName = intl.DateFormat('EEEE').format(this);
    return fullDayName.substring(0, 2);
  }

  /// Sunday 3 Sept
  String get formatToDayMonth {
    String dayName = intl.DateFormat('EEEE').format(this); 
    String dayNumber = intl.DateFormat('d').format(this); 
    String monthName = intl.DateFormat('MMM').format(this); 
    return '$dayName $dayNumber $monthName';
  }
}




extension TimeOfDayUtils on TimeOfDay {
  /// Converts TimeOfDay to a 24-hour string like '20:30'
  String to24HourString() {
    final dt = DateTime(0, 1, 1, hour, minute);
    return intl.DateFormat('HH:mm').format(dt);
  }

  /// Converts TimeOfDay to a 12-hour string like '08:30 PM'
  String to12HourString() {
    final dt = DateTime(0, 1, 1, hour, minute);
    return intl.DateFormat('hh:mm a').format(dt);
  }
}

extension StringToTimeOfDay on String {
  /// Parses 'HH:mm' format (e.g. '20:30') to TimeOfDay
  TimeOfDay toTimeOfDayFrom24Hour() {
    final parts = split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }


}


