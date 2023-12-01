import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourseEvent {
  String course;
  Timestamp endDate;
  Timestamp startEnd;
  String material;
  GeoPoint place;
  String title;

  CourseEvent({
    required this.course,
    required this.endDate,
    required this.startEnd,
    required this.material,
    required this.place,
    required this.title,
  });

  CourseEvent copyWith({
    String? course,
    Timestamp? endDate,
    Timestamp? startEnd,
    String? material,
    GeoPoint? place,
    String? title,
  }) {
    return CourseEvent(
      course: course ?? this.course,
      endDate: endDate ?? this.endDate,
      startEnd: startEnd ?? this.startEnd,
      material: material ?? this.material,
      place: place ?? this.place,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course': course,
      'endDate': endDate,
      'startEnd': startEnd,
      'material': material,
      'place': place,
      'title': title,
    };
  }

  factory CourseEvent.fromMap(Map<String, dynamic> map) {
    return CourseEvent(
      course: map['course'] as String,
      endDate: map['endDate'] as Timestamp,
      startEnd: map['startEnd'] as Timestamp,
      material: map['material'] as String,
      place: map['place'] as GeoPoint,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseEvent.fromJson(String source) =>
      CourseEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseEvent(course: $course, endDate: $endDate, startEnd: $startEnd, material: $material, place: $place, title: $title)';
  }

  @override
  bool operator ==(covariant CourseEvent other) {
    if (identical(this, other)) return true;

    return other.course == course &&
        other.endDate == endDate &&
        other.startEnd == startEnd &&
        other.material == material &&
        other.place == place &&
        other.title == title;
  }

  @override
  int get hashCode {
    return course.hashCode ^
        endDate.hashCode ^
        startEnd.hashCode ^
        material.hashCode ^
        place.hashCode ^
        title.hashCode;
  }
}
