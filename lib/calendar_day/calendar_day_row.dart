import 'package:flutter/material.dart';

import 'package:calendar/calendar_day/calendar_day.dart';
import 'package:calendar/models/workshop.dart';

// Row of CalendarDay widgets
class CalendarDayRow extends StatelessWidget {
  const CalendarDayRow({
    super.key,
    required this.dates,
    required this.currentMonth,
    required this.pickedDay,
    required this.onPressed,
    required this.workshopList,
  });

  final List<DateTime> dates;
  final DateTime currentMonth;
  final int pickedDay;
  final void Function(int) onPressed;
  final Map<Workshop, List<DateTime>> workshopList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 7; i++)
          CalendarDay(
            date: dates[i],
            visibleMonth: currentMonth,
            onPressed: onPressed,
            pickedDay: pickedDay,
            workshopList: workshopList,
          ),
      ],
    );
  }
}
