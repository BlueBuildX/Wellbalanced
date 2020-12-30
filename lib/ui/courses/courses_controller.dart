import 'package:wellbalanced_course/model/course.dart';
import 'package:wellbalanced_course/repository/repository.dart';

class CoursesController {
  final Repository _repository;

  CoursesController(this._repository);

  Future<List<Course>> getCourses() {
    return _repository.getCourses();
  }
}
