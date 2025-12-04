import 'question.dart';
import 'answer.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({
    required this.questions,
  });

  void answerQuestion(int index, String choice) {
    final question = questions[index];

    answers.removeWhere((a) => a.question == question);
    answers.add(Answer(
      question: question,
      selectedAnswer: choice,
    ));
  }

  int getScore() {
    return answers.where((answer) => answer.isCorrect()).length;
  }
}
