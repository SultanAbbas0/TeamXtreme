import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtreme/quiz/models/quiz.dart';

Future<List<Quiz>?> getQuizes() async {
  final quizes = await FirebaseFirestore.instance.collection('quiz').get();

  if (quizes.docs.isNotEmpty) {
    print(quizes.docs.map((e) => e.data()).toList());
    return quizes.docs.map((e) => Quiz.fromMap(e.data())).toList();
  } else {
    return null;
  }
}
