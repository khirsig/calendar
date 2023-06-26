import 'package:flutter/material.dart';

import 'package:calendar/calendar_workshop/calendar_workshop_label.dart';

// Shows info of selected planned workshop
class CalendarDayInfoWorkshops extends StatelessWidget {
  const CalendarDayInfoWorkshops(
      {super.key,
      required this.color,
      required this.name,
      required this.time,
      required this.length});

  final Color color;
  final String name;
  final String time;
  final String length;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 10, top: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            Text(
              time + ' - ' + length,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 10),
            CalendarWorkshopLabel(
              color: color,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
