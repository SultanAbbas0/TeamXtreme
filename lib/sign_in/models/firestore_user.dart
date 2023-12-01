// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FirestoreUser {
  final String email;
  final String phone;
  final String name;
  final String id;
  final String profileImg;
  FirestoreUser({
    required this.email,
    required this.phone,
    required this.name,
    required this.id,
    required this.profileImg,
  });

  FirestoreUser copyWith({
    String? email,
    String? phone,
    String? name,
    String? id,
    String? profileImg,
  }) {
    return FirestoreUser(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      id: id ?? this.id,
      profileImg: profileImg ?? this.profileImg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'name': name,
      'id': id,
      'profileImg': profileImg,
    };
  }

  factory FirestoreUser.fromMap(Map<String, dynamic> map) {
    return FirestoreUser(
      email: map['email'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
      id: map['id'] as String,
      profileImg: map['profileImg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirestoreUser.fromJson(String source) => FirestoreUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FirestoreUser(email: $email, phone: $phone, name: $name, id: $id, profileImg: $profileImg)';
  }

  @override
  bool operator ==(covariant FirestoreUser other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.phone == phone &&
        other.name == name &&
        other.id == id &&
        other.profileImg == profileImg;
  }

  @override
  int get hashCode {
    return email.hashCode ^ phone.hashCode ^ name.hashCode ^ id.hashCode ^ profileImg.hashCode;
  }
}
