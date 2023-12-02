import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xtreme/upcoming_events/models/course_event.dart';
import 'package:collection/collection.dart';

Future<List<CourseEvent>?> getCourseEvents() async {
  final events =
      await FirebaseFirestore.instance.collection('course-event').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => CourseEvent.fromMap(e.data())).toList();
  } else {
    return null;
  }
}

List<String> getNextfiveDays() {
  final List<String> nextSixDays = [];
  final DateTime now = DateTime.now();

  for (int i = 0; i < 7; i++) {
    final DateTime nextDay = now.add(Duration(days: i));
    final String dayName = DateFormat('EEEE').format(nextDay);
    nextSixDays.add(dayName);
  }

  return nextSixDays;
}

Future getFormattedCourseEvents() async {
  final events = await getCourseEvents();
  var dict = groupBy(events!,
      (CourseEvent obj) => DateFormat('EEEE').format(obj.startDate.toDate()));

  DateTime currentDate = DateTime.now();
  DateTime targetDate = currentDate.add(const Duration(days: 6));

  //DateTime now = DateTime.now();
  //DateTime after1day = now.add(const Duration(days: 1));
  //debugPrint('events ${events.length}');
  //final String today = DateFormat('EEEE').format(now);

  //final String tomorrow = DateFormat('EEEE').format(after1day);

  var count = {};
  final nextFiveDays = getNextfiveDays();
  for (var i = 0; i < nextFiveDays.length; i++) {
    count[nextFiveDays[i]] = 0;
  }

  for (var i = 0; i < events.length; i++) {
    final String dayName =
        DateFormat('EEEE').format(events[i].startDate.toDate());
    bool isAfter7Days = (events[i].startDate.toDate()).isAfter(targetDate);

    if (!isAfter7Days) {
      count[dayName] += 1;
    }
  }
  debugPrint('big $count');

  var result = dict.map((key, value) {
    //debugPrint("hello3 ${count[DateFormat('EEEE').format(key.toDate())]}");
    return MapEntry(
      key,
      {
        'count': count[key],
        'objects': value.toList(),
      },
    );
  });
  return result;
}
