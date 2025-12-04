import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';
import 'model/quiz.dart';
import 'data/sample_quiz.dart';

void main() {
  // 1 - Load the quiz data
  Quiz quiz = Quiz(questions: mockQuestions);

  // 2 - Display the quiz
  runApp(QuizApp(quiz: quiz));
}