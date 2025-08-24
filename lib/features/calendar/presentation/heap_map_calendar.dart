import 'package:flutter/material.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:habitroot/features/calendar/domain/calendar_event.dart';

import '../../../core/enum/date_event.dart';

class HeatMapCalendar extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final List<CalendarEvent> events;
  final Color baseColor;

  const HeatMapCalendar({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.events,
    this.baseColor = AppColorScheme.primary,
  });

  @override
  State<HeatMapCalendar> createState() => _HeatMapCalendarState();
}

class _HeatMapCalendarState extends State<HeatMapCalendar> {
  late final List<List<DateTime?>> _weeks;
  Map<DateTime, DateEvent> _eventMap = {};
  final ScrollController _scrollController = ScrollController();

  static const double _cellSize = 10;
  static final BorderRadius _cellRadius = BorderRadius.circular(1);

  @override
  void initState() {
    super.initState();
    _weeks = _generateWeeks(widget.startDate, widget.endDate);
    _eventMap = {
      for (final e in widget.events)
        DateTime(e.date.year, e.date.month, e.date.day): e.event
    };

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _eventMap = {
      for (final e in widget.events)
        DateTime(e.date.year, e.date.month, e.date.day): e.event
    };

    return SizedBox(
      height: _cellSize * 7 + 4 * 2 + 13,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_weeks.length, (weekIndex) {
            final week = _weeks[weekIndex];
            return Column(
              children: List.generate(7, (dayIndex) {
                final date = week[dayIndex];
                return _buildCell(date);
              }),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCell(DateTime? date) {
    if (date == null) {
      return const SizedBox(width: _cellSize, height: _cellSize);
    }

    final key = DateTime(date.year, date.month, date.day);
    final eventType = _eventMap[key] ?? DateEvent.normal;
    final opacity = eventType == DateEvent.completed ? 1.0 : 0.2;
    final color = widget.baseColor.withOpacity(opacity);

    return Container(
      margin: const EdgeInsets.all(1.5),
      width: _cellSize,
      height: _cellSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: _cellRadius,
      ),
    );
  }

  List<List<DateTime?>> _generateWeeks(DateTime start, DateTime end) {
    final weeks = <List<DateTime?>>[];
    // Align start to Sunday
    var current = start.subtract(Duration(days: start.weekday % 7));

    // Continue until we cover the end date
    while (!current.isAfter(end)) {
      final week = List<DateTime?>.generate(7, (i) {
        final day = current.add(Duration(days: i));
        // Only include days within [start, end] range
        if (day.isBefore(start) || day.isAfter(end)) {
          return null;
        }
        return day;
      });
      weeks.add(week);
      current = current.add(const Duration(days: 7));
    }
    return weeks;
  }
}



// class HeatMapCalendar extends StatefulWidget {
//   final DateTime startDate;
//   final DateTime endDate;
//   final List<CalendarEvent> events;
//   final Color baseColor;

//   const HeatMapCalendar({
//     super.key,
//     required this.startDate,
//     required this.endDate,
//     required this.events,
//     this.baseColor = AppColorScheme.primary,
//   });

//   @override
//   State<HeatMapCalendar> createState() => _HeatMapCalendarState();
// }

// class _HeatMapCalendarState extends State<HeatMapCalendar> {
//   late final List<List<DateTime?>> _weeks;
//   Map<DateTime, DateEvent> _eventMap = {};
//   final ScrollController _scrollController = ScrollController();

//   static const double _cellSize = 10;
//   static final BorderRadius _cellRadius = BorderRadius.circular(1);

//   @override
//   void initState() {
//     super.initState();
//     _weeks = _generateWeeks(widget.startDate, widget.endDate);
//     _eventMap = {
//       for (final e in widget.events)
//         DateTime(e.date.year, e.date.month, e.date.day): e.event
//     };

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _eventMap = {
//       for (final e in widget.events)
//         DateTime(e.date.year, e.date.month, e.date.day): e.event
//     };

//     return SizedBox(
//       height: _cellSize * 7 + 4 * 2 + 13,
//       child: SingleChildScrollView(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: List.generate(_weeks.length, (weekIndex) {
//             final week = _weeks[weekIndex];
//             return Column(
//               children: List.generate(7, (dayIndex) {
//                 final date = week[dayIndex];
//                 return _buildCell(date);
//               }),
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   Widget _buildCell(DateTime? date) {
//     if (date == null) {
//       return const SizedBox(width: _cellSize, height: _cellSize);
//     }

//     final key = DateTime(date.year, date.month, date.day);
//     final eventType = _eventMap[key] ?? DateEvent.normal;
//     final opacity = eventType == DateEvent.completed ? 1.0 : 0.2;
//     final color = widget.baseColor.withOpacity(opacity);

//     return Container(
//       margin: const EdgeInsets.all(1.5),
//       width: _cellSize,
//       height: _cellSize,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: _cellRadius,
//       ),
//     );
//   }

//   List<List<DateTime?>> _generateWeeks(DateTime start, DateTime end) {
//     final weeks = <List<DateTime?>>[];
//     // Align start to Sunday
//     var current = start.subtract(Duration(days: start.weekday % 7));

//     // Continue until we cover the end date
//     while (!current.isAfter(end)) {
//       final week = List<DateTime?>.generate(7, (i) {
//         final day = current.add(Duration(days: i));
//         // Only include days within [start, end] range
//         if (day.isBefore(start) || day.isAfter(end)) {
//           return null;
//         }
//         return day;
//       });
//       weeks.add(week);
//       current = current.add(const Duration(days: 7));
//     }
//     return weeks;
//   }
// }
