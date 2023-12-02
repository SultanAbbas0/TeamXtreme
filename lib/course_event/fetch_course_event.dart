import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/course_event/models/course_event.dart';

/// Helper method to interact with Firebase on `course-event` collection
Future<List<CourseEvent>?> getCourseEvents() async {
  final events =
      await FirebaseFirestore.instance.collection('course-event').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => CourseEvent.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
