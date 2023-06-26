import 'package:flutter/material.dart';

class Workshop {
  Workshop({required this.name, this.color = Colors.black, this.length = 0});

  String name;
  Color color;
  int length;
}
