import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/theme/theme.dart';
import '../widgets/app_button.dart';
import '../../model/quiz.dart';
 
class QuestionScreen extends StatefulWidget {

  final VoidCallback onFinsh;
  final Quiz quiz;
  const QuestionScreen({super.key, required this.onFinsh, required this.quiz});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currQuestionIndex = 0;
  String? selectedAnswer;
  bool showResult = false;

  void answerQuestion(String answer){
    if(showResult) return;

    setState(() {
      selectedAnswer = answer;
      widget.quiz.answerQuestion(currQuestionIndex, answer);
      showResult = true;
    });


  final lastIndex = widget.quiz.questions.length - 1;
  
  if (currQuestionIndex < lastIndex){
    setState(() {
      currQuestionIndex ++;
      selectedAnswer = null;
      showResult = false;
    });
  } else {
    widget.onFinsh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[currQuestionIndex];
    
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ...question.choices.map((answer){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppButton(
                    answer,
                    onTap: () => answerQuestion(answer),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
 