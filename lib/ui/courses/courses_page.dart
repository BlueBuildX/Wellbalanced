import 'package:flutter/material.dart';
import 'package:wellbalanced_course/model/course.dart';
import 'package:wellbalanced_course/repository/course_repository.dart';
import 'package:wellbalanced_course/ui/course_detail/course_detail_page.dart';
import 'package:wellbalanced_course/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _courses = CoursesController(CourseRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: _courses.getCourses(),
      builder: (context, snapshot) {
        var courses = snapshot.data;
        if (courses == null ||
            snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: courses.length,
          itemBuilder: (BuildContext context, int pisition) {
            return _buildRow(courses[pisition]);
          },
        );
      },
    );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            course.name,
            style: TextStyle(fontSize: 18),
          ),
        ),
        trailing: Hero(
          tag: 'cardArtwork-${course.courseId}',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              course.artworkUrl,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                return Icon(Icons.error);
              },
            ),
          ),
        ),
        subtitle: Text("Price: ${course.price}"),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CourseDetailPage(
              course: course,
            ),
          ));
        },
      ),
    );
  }
}
