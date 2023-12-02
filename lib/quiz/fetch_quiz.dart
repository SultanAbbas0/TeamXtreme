import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/quiz/models/quiz.dart';

/// Helper method to interact with Firebase on `quiz` collection
Future<List<Quiz>?> getQuizzes() async {
  final quizes = await FirebaseFirestore.instance.collection('quiz').get();

  if (quizes.docs.isNotEmpty) {
    return quizes.docs.map((e) => Quiz.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
