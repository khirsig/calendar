import 'package:flutter/material.dart';

class CalendarWorkshopLabel extends StatelessWidget {
  const CalendarWorkshopLabel({
    super.key,
    required this.color,
    this.hour = 0,
    this.margin = 0,
  });

  final Color color;
  final int hour;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 20,
      margin: EdgeInsets.only(top: margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
