import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ClubEvent {
  Timestamp date;
  String description;
  String icon;
  String organizer;
  String place;
  String registrationLink;
  String title;

  ClubEvent({
    required this.date,
    required this.description,
    required this.icon,
    required this.organizer,
    required this.place,
    required this.registrationLink,
    required this.title,
  });

  ClubEvent copyWith({
    Timestamp? date,
    String? description,
    String? icon,
    String? organizer,
    String? place,
    String? registrationLink,
    String? title,
  }) {
    return ClubEvent(
      date: date ?? this.date,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      organizer: organizer ?? this.organizer,
      place: place ?? this.place,
      registrationLink: registrationLink ?? this.registrationLink,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'description': description,
      'icon': icon,
      'organizer': organizer,
      'place': place,
      'registrationLink': registrationLink,
      'title': title,
    };
  }

  factory ClubEvent.fromMap(Map<String, dynamic> map) {
    return ClubEvent(
      date: map['date'] as Timestamp, // TODO:
      description: map['description'] as String,
      icon: map['icon'] as String,
      organizer: map['organizer'] as String,
      place: map['place'] as String, // TODO:
      registrationLink: map['registrationLink'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubEvent.fromJson(String source) =>
      ClubEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClubEvent(date: $date, description: $description, icon: $icon, organizer: $organizer, place: $place, registrationLink: $registrationLink, title: $title)';
  }

  @override
  bool operator ==(covariant ClubEvent other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.description == description &&
        other.icon == icon &&
        other.organizer == organizer &&
        other.place == place &&
        other.registrationLink == registrationLink &&
        other.title == title;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        organizer.hashCode ^
        place.hashCode ^
        registrationLink.hashCode ^
        title.hashCode;
  }
}
