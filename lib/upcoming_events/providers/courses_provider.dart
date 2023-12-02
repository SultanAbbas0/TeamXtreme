import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/upcoming_events/models/fetch_course_event.dart';

final coursesProvider = FutureProvider((ref) async {
  return getFormattedCourseEvents();
});
