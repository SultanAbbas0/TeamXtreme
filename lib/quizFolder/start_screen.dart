import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xtreme/quiz/provider.dart';
import 'package:xtreme/quizFolder/questions_screen.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  ConsumerState<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends ConsumerState<StartScreen> {
  @override
  Widget build(context) {
    final isEnabled = ref.watch(provider1);
    return isEnabled
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/ui/images/quiz-logo - Copy (2).png',
                        width: 300,
                        color: const Color.fromARGB(150, 255, 255, 255),
                      ),
                      Image.asset(
                        'assets/ui/images/kfupm.png',
                        width: 200,
                        color: const Color.fromARGB(150, 255, 255, 255),
                      ),
                    ],
                  ),
                  // Opacity(
                  //   opacity: 0.6,
                  //   child: Image.asset(
                  //     'assets/images/quiz-logo.png',
                  //     width: 300,
                  //   ),
                  // ),
                  const SizedBox(height: 80),
                  const Text(
                    'Learn Flutter the fun way!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 30),
                  OutlinedButton.icon(
                    onPressed: () {
                      ref.watch(provider1.notifier).state =
                          !ref.watch(provider1.notifier).state;
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text('Start Quiz'),
                  )
                ],
              ),
            ),
          )
        : QuestionsScreen(onSelectAnswer: (a) {});
  }
}
