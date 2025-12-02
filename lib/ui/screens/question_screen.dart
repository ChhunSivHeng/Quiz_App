import 'package:flutter/material.dart';
import '../widgets/question_button.dart';
import '../../data/quiz_MockData.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final question = mockQuestions[0];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ...question.choices.map((choice) => QuestionButton(answerChoice: choice, onTap: (),))
            ],
          ),
        ),
      ),
    )
  }
}
 