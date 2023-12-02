// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  final String finalGrade;
  final String title;
  final String code;
  final String instructor;
  Course({
    required this.finalGrade,
    required this.title,
    required this.code,
    required this.instructor,
  });

  Course copyWith({
    String? finalGrade,
    String? title,
    String? code,
    String? instructor,
  }) {
    return Course(
      finalGrade: finalGrade ?? this.finalGrade,
      title: title ?? this.title,
      code: code ?? this.code,
      instructor: instructor ?? this.instructor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'finalGrade': finalGrade,
      'title': title,
      'code': code,
      'instructor': instructor,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      finalGrade: map['finalGrade'] as String,
      title: map['title'] as String,
      code: map['code'] as String,
      instructor: map['instructor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Course(finalGrade: $finalGrade, title: $title, code: $code, instructor: $instructor)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.finalGrade == finalGrade &&
        other.title == title &&
        other.code == code &&
        other.instructor == instructor;
  }

  @override
  int get hashCode {
    return finalGrade.hashCode ^ title.hashCode ^ code.hashCode ^ instructor.hashCode;
  }
}
