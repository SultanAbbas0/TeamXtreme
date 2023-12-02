import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/club/models/club.dart';

/// Helper method to interact with Firebase on `club` collection
Future<List<Club>?> getClubEvents() async {
  final events = await FirebaseFirestore.instance.collection('club').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => Club.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
