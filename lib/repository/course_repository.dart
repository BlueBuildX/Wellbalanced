import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wellbalanced_course/model/course.dart';
import 'package:wellbalanced_course/repository/repository.dart';

class CourseRepository implements Repository {
  String dataURL = "https://wellbalancedenglishapi.xyz/course";

  @override
  Future<List<Course>> getCourses() async {
    var courses = <Course>[];

    var url = dataURL;

    http.Response response = await http.get(url);

    final apiRes = json.decode(response.body);

    apiRes.map((json) {
      courses.add(Course.fromJson(json));
    }).toList();

    return courses;
  }
}
