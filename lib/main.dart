import 'package:flutter/material.dart';

import 'package:calendar/calendar.dart';
import 'package:calendar/data/demo_workshops.dart';

void main() {
  runApp(
    Calendar(
      workshopList: demoWorkshops,
    ),
  );
}
