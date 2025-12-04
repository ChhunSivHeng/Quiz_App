import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import '../model/quiz.dart';

enum ChangeScreen { welcome, question, result }

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ChangeScreen current = ChangeScreen.welcome;

  Quiz get quiz => widget.quiz;

  void goToQuestionScreen() {
    setState(() {
      current = ChangeScreen.question;
    });

    quiz.answers.clear();
  }

  void goToWelcomeScreen() {
    setState(() {
      current = ChangeScreen.welcome;
    });
  }

  void goToResultScreen() {
    setState(() {
      current = ChangeScreen.result;
    });
  }

  Widget renderScreen(ChangeScreen screen) {
    switch (screen) {
      case ChangeScreen.welcome:
        return WelcomeScreen(
          onStart: goToQuestionScreen
          );

      case ChangeScreen.question:
        return QuestionScreen(
          quiz: quiz,
          onFinsh: goToResultScreen,
        );

      case ChangeScreen.result:
        return ResultScreen(
          quiz: quiz,
          onRestart: goToWelcomeScreen,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: renderScreen(current),
      ),
    );
  }
}