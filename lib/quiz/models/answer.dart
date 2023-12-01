import 'dart:convert';

class Answer {
  String content;
  bool isCorrect;
  Answer({
    required this.content,
    required this.isCorrect,
  });

  Answer copyWith({
    String? content,
    bool? isCorrect,
  }) {
    return Answer(
      content: content ?? this.content,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      content: map['content'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answer(content: $content, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;

    return other.content == content && other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => content.hashCode ^ isCorrect.hashCode;
}
