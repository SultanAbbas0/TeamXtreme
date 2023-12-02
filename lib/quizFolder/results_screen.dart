import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_summary/questions_summary.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': widget.chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            setState(() {
              widget.onRestart();
            });
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.refresh,
            size: 35,
          ),
          label: const Text(
            'Restart Quiz!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
