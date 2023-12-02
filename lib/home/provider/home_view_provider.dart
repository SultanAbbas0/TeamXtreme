import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../news/models/news.dart';

final newsCollection = FirebaseFirestore.instance.collection('news');
final newsProvider = FutureProvider<List<News>>(
  (ref) async => (await (newsCollection.get()))
      .docs
      .map((e) => News.fromMap(e.data()))
      .toList(),
);
