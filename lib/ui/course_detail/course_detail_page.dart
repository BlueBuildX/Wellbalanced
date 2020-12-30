import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:wellbalanced_course/model/course.dart';
import 'package:wellbalanced_course/ui/course_detail/image_container.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({Key key, Course this.course}) : super(key: key);

  void _lanuchCourse(String courseId) {
    launch("https://wellbalancedenglish.com/course/$courseId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          _buildMain(context),
          _buildDetail(context),
          Center(
            child: FlatButton(
              child: Text("View course."),
              onPressed: () => _lanuchCourse(course.courseId),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Hero(
        tag: 'cardArtwork-${course.courseId}',
        transitionOnUserGestures: true,
        child: ImageContainer(height: 200, url: course.artworkUrl));
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            course.name,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 30),
          ),
          Text(
            course.description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    final style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13, bottom: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price: ${course.price}",
            style: style,
          ),
          Text(
            "Hour: ${course.hour}",
            style: style,
          ),
        ],
      ),
    );
  }
}
