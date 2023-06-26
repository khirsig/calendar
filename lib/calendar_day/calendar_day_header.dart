import 'package:flutter/material.dart';

import 'package:calendar/calendar_day/calendar_day_header_text.dart';

// Shows each day on top of the calendar month view
class CalendarDayHeader extends StatelessWidget {
  const CalendarDayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CalendarDayHeaderText(text: 'Mo'),
        CalendarDayHeaderText(text: 'Di'),
        CalendarDayHeaderText(text: 'Mi'),
        CalendarDayHeaderText(text: 'Do'),
        CalendarDayHeaderText(text: 'Fr'),
        CalendarDayHeaderText(text: 'Sa'),
        CalendarDayHeaderText(text: 'So'),
      ],
    );
  }
}
