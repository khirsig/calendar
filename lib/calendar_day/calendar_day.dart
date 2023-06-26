import 'package:flutter/material.dart';

import 'package:calendar/models/workshop.dart';
import 'package:calendar/calendar_workshop/calendar_workshop_label.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    super.key,
    required this.date,
    required this.visibleMonth,
    required this.onPressed,
    required this.pickedDay,
    required this.workshopList,
  });

  final DateTime date;
  final DateTime visibleMonth;
  final int pickedDay;
  final void Function(int) onPressed;
  final Map<Workshop, List<DateTime>> workshopList;

  List<Widget> _getWorkshopsForDay() {
    List<CalendarWorkshopLabel> workshopsForDay = [];
    for (var workshop in workshopList.keys) {
      for (var workshopDate in workshopList[workshop]!) {
        if (workshopDate.day == date.day &&
            workshopDate.month == date.month &&
            workshopDate.year == date.year &&
            workshopsForDay.length < 12) {
          workshopsForDay.add(CalendarWorkshopLabel(
            color: workshop.color,
            hour: workshopDate.hour,
            margin: 1.5,
          ));
        }
      }
    }

    workshopsForDay.sort((a, b) => a.hour.compareTo(b.hour));
    return workshopsForDay;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: visibleMonth.month == date.month ? true : false,
        child: Container(
          margin: const EdgeInsets.all(2),
          child: SizedBox(
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                onPressed(date.day);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: pickedDay == date.day
                      ? Colors.blue
                      : const Color.fromARGB(255, 234, 234, 234),
                  width: pickedDay == date.day ? 3 : 2,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 3),
                  Text(
                    date.day.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      ..._getWorkshopsForDay(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
