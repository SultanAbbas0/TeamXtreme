import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourseEvent {
  String course;
  Timestamp endDate;
  Timestamp startDate;
  String material;
  String place;
  String title;

  CourseEvent({
    required this.course,
    required this.endDate,
    required this.startDate,
    required this.material,
    required this.place,
    required this.title,
  });

  CourseEvent copyWith({
    String? course,
    Timestamp? endDate,
    Timestamp? startDate,
    String? material,
    String? place,
    String? title,
  }) {
    return CourseEvent(
      course: course ?? this.course,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      material: material ?? this.material,
      place: place ?? this.place,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course': course,
      'endDate': endDate,
      'startDate': startDate,
      'material': material,
      'place': place,
      'title': title,
    };
  }

  factory CourseEvent.fromMap(Map<String, dynamic> map) {
    return CourseEvent(
      course: map['course'] as String,
      endDate: map['endDate'] as Timestamp,
      startDate: map['startDate'] as Timestamp,
      material: map['material'] as String,
      place: map['place'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseEvent.fromJson(String source) =>
      CourseEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseEvent(course: $course, endDate: $endDate, startDate: $startDate, material: $material, place: $place, title: $title)';
  }

  @override
  bool operator ==(covariant CourseEvent other) {
    if (identical(this, other)) return true;

    return other.course == course &&
        other.endDate == endDate &&
        other.startDate == startDate &&
        other.material == material &&
        other.place == place &&
        other.title == title;
  }

  @override
  int get hashCode {
    return course.hashCode ^
        endDate.hashCode ^
        startDate.hashCode ^
        material.hashCode ^
        place.hashCode ^
        title.hashCode;
  }
}
