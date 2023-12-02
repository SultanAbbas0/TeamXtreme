import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/club_event/models/club_event.dart';

/// Helper method to interact with Firebase on `club-event` collection
Future<List<ClubEvent>?> getClubEvents() async {
  final events =
      await FirebaseFirestore.instance.collection('club-event').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => ClubEvent.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
