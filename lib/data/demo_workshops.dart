import 'package:flutter/material.dart';

import 'package:calendar/models/workshop.dart';

Map<Workshop, List<DateTime>> demoWorkshops = {
  Workshop(
    name: 'Workshop 1',
    color: Colors.blue,
    length: 2,
  ): [
    DateTime(2023, 6, 5, 12),
    DateTime(2023, 6, 6, 12),
  ],
  Workshop(
    name: 'Workshop 2',
    color: const Color.fromARGB(255, 231, 27, 27),
    length: 3,
  ): [
    DateTime(2023, 6, 6, 15),
    DateTime(2023, 6, 7, 15),
    DateTime(2023, 6, 9, 15),
  ],
  Workshop(
    name: 'Workshop 3',
    color: const Color.fromARGB(255, 50, 203, 208),
    length: 1,
  ): [
    DateTime(2023, 6, 6, 13),
    DateTime(2023, 6, 8, 13),
    DateTime(2023, 6, 9, 13),
    DateTime(2023, 6, 14, 13),
  ],
  Workshop(
    name: 'Workshop 4',
    color: const Color.fromARGB(255, 166, 90, 194),
    length: 5,
  ): [
    DateTime(2023, 6, 6, 10),
    DateTime(2023, 6, 14, 10),
    DateTime(2023, 6, 20, 10),
    DateTime(2023, 7, 1, 10),
  ],
  Workshop(
    name: 'Workshop 5',
    color: const Color.fromARGB(255, 94, 202, 61),
    length: 3,
  ): [
    DateTime(2023, 6, 6, 11),
    DateTime(2023, 6, 13, 11),
    DateTime(2023, 6, 14, 11),
    DateTime(2023, 6, 24, 11),
  ],
  Workshop(
    name: 'Workshop 6',
    color: const Color.fromARGB(255, 242, 185, 0),
    length: 5,
  ): [
    DateTime(2023, 6, 8, 14),
    DateTime(2023, 6, 15, 14),
    DateTime(2023, 6, 16, 14),
  ],
};
