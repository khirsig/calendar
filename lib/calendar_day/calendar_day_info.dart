import 'package:flutter/material.dart';

import 'package:calendar/data/month_conversion.dart';
import 'package:calendar/models/workshop.dart';
import 'package:calendar/calendar_day/calendar_day_info_workshops.dart';
import 'package:calendar/data/time_conversion.dart';

// Shows info of all workshops happening on the selected day
class CalendarDayInfo extends StatelessWidget {
  const CalendarDayInfo(
      {super.key,
      required this.pickedDay,
      required this.date,
      required this.workshopList});

  final int pickedDay;
  final DateTime date;
  final Map<Workshop, List<DateTime>> workshopList;

  List<Widget> _getWorkshopsForDay() {
    List<CalendarDayInfoWorkshops> workshopsForDay = [];

    for (var workshop in workshopList.keys) {
      for (var workshopDate in workshopList[workshop]!) {
        if (workshopDate.day == pickedDay &&
            workshopDate.month == date.month &&
            workshopDate.year == date.year) {
          workshopsForDay.add(
            CalendarDayInfoWorkshops(
              color: workshop.color,
              name: workshop.name,
              time: formatTime(workshopDate.hour, workshopDate.minute),
              length: formatTime(
                  workshopDate.hour + workshop.length, workshopDate.minute),
            ),
          );
        }
      }
    }

    workshopsForDay.sort((a, b) => a.time.compareTo(b.time));

    return workshopsForDay;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                pickedDay.toString() + '. ' + monthConversion[date.month - 1],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 114, 114, 114),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ..._getWorkshopsForDay(),
          ],
        ),
      ),
    );
  }
}
