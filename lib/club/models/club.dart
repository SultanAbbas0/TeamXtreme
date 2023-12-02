// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Club {
  String logo;
  String name;
  String code;

  Club({
    required this.logo,
    required this.name,
    required this.code,
  });

  Club copyWith({
    String? logo,
    String? name,
    String? code,
  }) {
    return Club(
      logo: logo ?? this.logo,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'name': name,
      'code': code,
    };
  }

  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      logo: map['logo'] as String,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Club.fromJson(String source) =>
      Club.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Club(logo: $logo, name: $name, code: $code)';

  @override
  bool operator ==(covariant Club other) {
    if (identical(this, other)) return true;

    return other.logo == logo && other.name == name && other.code == code;
  }

  @override
  int get hashCode => logo.hashCode ^ name.hashCode ^ code.hashCode;
}
