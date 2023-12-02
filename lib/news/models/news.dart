import 'dart:convert';

class News {
  String content;
  String linkedin;
  String twitter;

  News({
    required this.content,
    required this.linkedin,
    required this.twitter,
  });

  News copyWith({
    String? content,
    String? linkedin,
    String? twitter,
  }) {
    return News(
      content: content ?? this.content,
      linkedin: linkedin ?? this.linkedin,
      twitter: twitter ?? this.twitter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'linkedin': linkedin,
      'twitter': twitter,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      content: map['content'] as String,
      linkedin: map['linkedin'] as String,
      twitter: map['twitter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'News(content: $content, linkedin: $linkedin, twitter: $twitter)';

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.content == content &&
        other.linkedin == linkedin &&
        other.twitter == twitter;
  }

  @override
  int get hashCode => content.hashCode ^ linkedin.hashCode ^ twitter.hashCode;
}
