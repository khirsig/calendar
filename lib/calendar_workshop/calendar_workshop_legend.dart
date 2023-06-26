import 'package:flutter/material.dart';

import 'package:calendar/models/workshop.dart';
import 'package:calendar/calendar_workshop/calendar_workshop_legend_element.dart';

class CalendarWorkshopLegend extends StatelessWidget {
  const CalendarWorkshopLegend(
      {super.key, required this.workshopList, required this.pickedTime});

  final Map<Workshop, List<DateTime>> workshopList;
  final DateTime pickedTime;

  List<Widget> _getWorkshopLegend() {
    List<Widget> workshopLegend = [];
    for (var workshop in workshopList.keys) {
      for (var workshopDate in workshopList[workshop]!) {
        if (workshopDate.month == pickedTime.month &&
            workshopDate.year == pickedTime.year) {
          workshopLegend.add(CalendarWorkshopLegendElement(workshop));
          break;
        }
      }
    }
    return workshopLegend;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
        spacing: 10,
        runSpacing: 1,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          ..._getWorkshopLegend(),
        ],
      ),
    );
  }
}
