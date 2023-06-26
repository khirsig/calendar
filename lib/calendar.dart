import 'package:flutter/material.dart';

import 'package:calendar/calendar_date_header.dart';
import 'package:calendar/calendar_day/calendar_day_header.dart';
import 'package:calendar/calendar_day/calendar_day_row.dart';
import 'package:calendar/calendar_day/calendar_day_info.dart';
import 'package:calendar/models/workshop.dart';
import 'package:calendar/calendar_workshop/calendar_workshop_legend.dart';

// Calendar widget that displays a month view with possible workshops
class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    this.workshopList = const {},
  });

  final Map<Workshop, List<DateTime>> workshopList;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var _currentMonth = DateTime.now();
  var _pickedDay = -1;

  // Returns a list of dates for a given week number in current month
  List<DateTime> _getWeekDates(int weekNbr) {
    List<DateTime> dates = [];
    var firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    var offsetToMonday = firstDayOfMonth.weekday - 1;
    var firstMonday = firstDayOfMonth.subtract(Duration(days: offsetToMonday));
    var weekStart = firstMonday.add(Duration(days: (weekNbr - 1) * 7));

    // Fix dates for winter-time change in october
    for (var i = 0; i < 7; i++) {
      dates.add(weekStart.add(Duration(days: i)));
      if (dates[i].hour == 23) {
        dates[i] = dates[i].add(const Duration(hours: 1));
      }
    }
    return dates;
  }

  // Advances to next month
  void _nextMonth() {
    setState(() {
      var nextMonth = _currentMonth.month + 1;
      if (nextMonth >= 13) {
        _currentMonth = DateTime(_currentMonth.year + 1, 1, 1);
      } else {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      }
      _pickedDay = -1;
    });
  }

  // Goes back to previous month
  void _previousMonth() {
    setState(() {
      var previousMonth = _currentMonth.month - 1;
      if (previousMonth <= 0) {
        _currentMonth = DateTime(_currentMonth.year - 1, 12, 1);
      } else {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      }
      _pickedDay = -1;
    });
  }

  // Selects a day in the calendar for showing its details
  void _selectDay(int day) {
    setState(() {
      _pickedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            child: CalendarDateHeader(
                date: _currentMonth,
                nextMonth: _nextMonth,
                previousMonth: _previousMonth),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const CalendarDayHeader(),
            const Divider(thickness: 3),
            for (var i = 1; i <= 6; i++)
              CalendarDayRow(
                dates: _getWeekDates(i),
                currentMonth: _currentMonth,
                onPressed: _selectDay,
                pickedDay: _pickedDay,
                workshopList: widget.workshopList,
              ),
            const SizedBox(height: 10),
            CalendarWorkshopLegend(
              workshopList: widget.workshopList,
              pickedTime: _currentMonth,
            ),
            const SizedBox(height: 5),
            const Divider(thickness: 3),
            const SizedBox(height: 10),
            if (_pickedDay != -1)
              CalendarDayInfo(
                pickedDay: _pickedDay,
                date: _currentMonth,
                workshopList: widget.workshopList,
              ),
          ],
        ),
      ),
    );
  }
}
