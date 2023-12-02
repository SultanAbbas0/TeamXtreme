import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/quiz/provider.dart';
import 'package:xtreme/quizFolder/results_screen.dart';

import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  ConsumerState<QuestionsScreen> createState() {
    return QuestionsScreenState();
  }
}

class QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final isEnabled = ref.watch(provider2);
    var currentQuestion = questions[0];
    if (currentQuestionIndex != 6) {
      currentQuestion = questions[currentQuestionIndex];
    } else {
      currentQuestion = questions[0];
    }
    return isEnabled
        ? Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      currentQuestion.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ...currentQuestion.getShuffledAnswers().map((answer) {
                      return AnswerButton(
                        answerText: answer,
                        onTap: () {
                          answerQuestion(answer);
                          if (currentQuestionIndex == 6) {
                            ref.read(provider2.notifier).state =
                                !ref.read(provider2.notifier).state;
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        : ResultsScreen(
            chosenAnswers: const [],
            onRestart: () {
              ref.watch(provider1.notifier).state = true;
              ref.watch(provider2.notifier).state = true;
            },
          );
  }
}
