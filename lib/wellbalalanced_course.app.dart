import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellbalanced_course/ui/courses/courses_page.dart';

class WellBalancedCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Well Balanced English"),
      ),
      body: CoursesPage(),
    );
  }
}
