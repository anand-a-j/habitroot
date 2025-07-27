import 'package:flutter/material.dart';
import 'package:habitroot/core/enum/weekday.dart';
import 'package:habitroot/core/extension/common.dart';

class WeekdayListview extends StatefulWidget {
  final List<Weekday> selectedDays;
  final ValueChanged<List<Weekday>> onChange;

  const WeekdayListview({
    Key? key,
    required this.selectedDays,
    required this.onChange,
  }) : super(key: key);

  @override
  State<WeekdayListview> createState() => _WeekdayListviewState();
}

class _WeekdayListviewState extends State<WeekdayListview> {
  late List<Weekday> _selectedDays;

  @override
  void initState() {
    super.initState();
    _selectedDays = List.from(widget.selectedDays);
  }

  void _toggleDay(Weekday day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
      widget.onChange(_selectedDays);
    });
  }

  @override
  void didUpdateWidget(covariant WeekdayListview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDays != widget.selectedDays) {
      _selectedDays = List.from(widget.selectedDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10                                                 ,
        children: Weekday.values.map((day) {
          final isSelected = _selectedDays.contains(day);
          return GestureDetector(
            onTap: () => _toggleDay(day),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? context.primary : context.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                getAbbreviation(day),
                style: context.bodyMedium?.copyWith(
                    color: isSelected
                        ? context.onPrimary
                        : context.onPrimary.withValues(alpha: 0.5)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
