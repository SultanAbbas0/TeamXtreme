import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:xtreme/quiz/models/answer.dart';

class Question {
  num points;
  String title;
  List<Answer> answers;

  Question({
    required this.points,
    required this.title,
    required this.answers,
  });

  Question copyWith({
    num? points,
    String? title,
    List<Answer>? answers,
  }) {
    return Question(
      points: points ?? this.points,
      title: title ?? this.title,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'points': points,
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      points: map['points'] as num,
      title: map['title'] as String,
      answers: List<Answer>.from(
        (map['answers'] as List<dynamic>).map<Answer>(
          (x) => Answer.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Question(points: $points, title: $title, answers: $answers)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.points == points &&
        other.title == title &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode => points.hashCode ^ title.hashCode ^ answers.hashCode;
}
