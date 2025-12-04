import 'package:flutter/material.dart';
import '../widgets/round.dart';
import '../../model/quiz.dart';
import '../../model/answer.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.quiz, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // display score 
              Text(
                "You answered ${quiz.getScore()} on ${quiz.questions.length}!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // loop list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quiz.answers.length,
                itemBuilder: (context, index) {
                  final userAnswer = quiz.answers[index];
                  return SingleAnswerView(
                    userAnswer: userAnswer,
                    questionNumber: index,
                  );
                },
              ),
              const SizedBox(height: 30),

              AppButton(
                "Restart Quiz",
                onTap: onRestart,
                icon: Icons.refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleAnswerView extends StatelessWidget {
  final Answer userAnswer;
  final int questionNumber;

  const SingleAnswerView({
    super.key,
    required this.userAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RoundaboutNumber(
                  number: questionNumber + 1,
                  color: userAnswer.isCorrect() ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    userAnswer.question.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Choices
            ...userAnswer.question.choices.map((choice) {
              IconData? markIcon;
              Color markColor = Colors.black;

              if (choice == userAnswer.question.goodChoice) {
                markIcon = Icons.check;
                markColor = Colors.green;
              } else if (choice == userAnswer.selectedAnswer &&
                  choice != userAnswer.question.goodChoice) {
                markIcon = Icons.close;
                markColor = Colors.red;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: markIcon != null
                          ? Icon(markIcon, size: 20, color: markColor)
                          : null,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        choice,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: markColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}