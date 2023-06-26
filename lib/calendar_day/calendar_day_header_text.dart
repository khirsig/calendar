import 'package:flutter/material.dart';

class CalendarDayHeaderText extends StatelessWidget {
  const CalendarDayHeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 114, 114, 114),
        ),
      ),
    );
  }
}
