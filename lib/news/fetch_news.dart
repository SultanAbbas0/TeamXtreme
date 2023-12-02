import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/news/models/news.dart';

/// Helper method to interact with Firebase on `news` collection
Future<List<News>?> getNews() async {
  final events = await FirebaseFirestore.instance.collection('news').get();

  if (events.docs.isNotEmpty) {
    return events.docs.map((e) => News.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
