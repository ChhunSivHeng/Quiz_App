import 'question.dart';

class Answer {
  final Question question;
  final String selectedAnswer;

  Answer({
    required this.question,
    required this.selectedAnswer,
  });

  bool isCorrect() {
    return selectedAnswer == question.goodChoice;
  }
}
