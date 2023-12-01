import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:xtreme/quiz/models/question.dart';

class Quiz {
  String code;
  String course;
  List<Question> questions;
  Quiz({
    required this.code,
    required this.course,
    required this.questions,
  });

  Quiz copyWith({
    String? code,
    String? course,
    List<Question>? questions,
  }) {
    return Quiz(
      code: code ?? this.code,
      course: course ?? this.course,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'course': course,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      code: map['code'] as String,
      course: map['course'] as String,
      questions: List<Question>.from(
        (map['questions'] as List<dynamic>).map<Question>(
          (x) => Question.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Quiz(code: $code, course: $course, questions: $questions)';

  @override
  bool operator ==(covariant Quiz other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.course == course &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode => code.hashCode ^ course.hashCode ^ questions.hashCode;
}
