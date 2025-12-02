import 'question.dart';

class Answer {
  final Question question;
  final String anwerChoice;

  Answer({
    required this.question,
    required this.anwerChoice,
  });

  // Returns true if the answer is correct
  bool isCorrect() {
    return anwerChoice == question.goodChoice;
  }
}
