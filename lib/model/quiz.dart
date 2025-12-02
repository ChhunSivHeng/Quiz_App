import 'question.dart';
import 'answer.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({
    required this.questions,
    required this.answers,
  });

  // Returns the number of correct answers
  int getScore() {
    return answers.where((answer) => answer.isCorrect()).length;
  }
}
