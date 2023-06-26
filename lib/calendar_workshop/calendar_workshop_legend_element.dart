import 'package:flutter/material.dart';

import 'package:calendar/models/workshop.dart';
import 'package:calendar/calendar_workshop/calendar_workshop_label.dart';

// Element to be put on the workshop legend of the calendar
class CalendarWorkshopLegendElement extends StatelessWidget {
  const CalendarWorkshopLegendElement(this.workshop, {super.key});

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarWorkshopLabel(color: workshop.color),
        Text(
          ' ' + workshop.name,
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromARGB(255, 137, 137, 137),
          ),
        ),
      ],
    );
  }
}
