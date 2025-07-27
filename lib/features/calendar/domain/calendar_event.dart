

import 'package:habitroot/core/enum/date_event.dart';

class CalendarEvent {
  final DateTime date;
  final DateEvent event;

  CalendarEvent({
    required this.date,
    this.event = DateEvent.normal,
  });
}
