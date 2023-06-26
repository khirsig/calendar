import 'package:flutter/material.dart';

import 'package:calendar/data/month_conversion.dart';

class CalendarDateHeader extends StatelessWidget {
  const CalendarDateHeader(
      {super.key,
      required this.date,
      required this.nextMonth,
      required this.previousMonth});

  final DateTime date;
  final void Function() previousMonth;
  final void Function() nextMonth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: previousMonth,
          ),
          Text(
            monthConversion[date.month - 1] + ' ' + date.year.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 242, 242, 242),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: nextMonth,
          ),
        ],
      ),
    );
  }
}
