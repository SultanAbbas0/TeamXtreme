// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class FirestoreUser {
  final String email;
  final String phone;
  final String name;
  final String id;
  final String profileImg;
  final Color? primaryColor;
  final Color? secondaryColor;
  FirestoreUser({
    required this.email,
    required this.phone,
    required this.name,
    required this.id,
    required this.profileImg,
    required this.primaryColor,
    required this.secondaryColor,
  });

  FirestoreUser copyWith({
    String? email,
    String? phone,
    String? name,
    String? id,
    String? profileImg,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return FirestoreUser(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      id: id ?? this.id,
      profileImg: profileImg ?? this.profileImg,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'name': name,
      'id': id,
      'profileImg': profileImg,
      'primaryColor': primaryColor?.value,
      'secondaryColor': secondaryColor?.value,
    };
  }

  factory FirestoreUser.fromMap(Map<String, dynamic> map) {
    return FirestoreUser(
      email: map['email'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
      id: map['id'] as String,
      profileImg: map['profileImg'] as String,
      primaryColor: map['primaryColor'] != null
          ? Color(map['primaryColor'] as int)
          : null,
      secondaryColor:
          map['secondaryColor'] != null ? Color(map['secondaryColor']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirestoreUser.fromJson(String source) =>
      FirestoreUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FirestoreUser(email: $email, phone: $phone, name: $name, id: $id, profileImg: $profileImg, primaryColor: $primaryColor, secondaryColor: $secondaryColor)';
  }

  @override
  bool operator ==(covariant FirestoreUser other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.phone == phone &&
        other.name == name &&
        other.id == id &&
        other.profileImg == profileImg &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        id.hashCode ^
        profileImg.hashCode ^
        primaryColor.hashCode ^
        secondaryColor.hashCode;
  }

  get firstName {
    return name.split(" ")[0];
  }
}
