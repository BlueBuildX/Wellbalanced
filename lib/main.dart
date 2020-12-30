import 'package:flutter/material.dart';
import 'package:wellbalanced_course/util/hex_color.dart';
import 'package:wellbalanced_course/wellbalalanced_course.app.dart';

void main() {
  runApp(MaterialApp(
    title: "Well balanced english",
    theme: ThemeData(primaryColor: HexColor.fromHex("#FCF2D6")),
    home: WellBalancedCourse(),
  ));
}
