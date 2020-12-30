import 'package:wellbalanced_course/model/course.dart';

abstract class Repository {
  Future<List<Course>> getCourses();
}
