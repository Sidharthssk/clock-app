import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String? discription;
  List<Color>? gradientColors;

  AlarmInfo(this.alarmDateTime, {this.discription,this.gradientColors});
}
