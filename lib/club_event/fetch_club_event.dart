import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/club_event/club_event.dart';

Future<List<ClubEvent>?> getClubEvents() async {
  final events =
      await FirebaseFirestore.instance.collection('club-event').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => ClubEvent.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
