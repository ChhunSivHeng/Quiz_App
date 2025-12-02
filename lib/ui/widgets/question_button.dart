import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String answerChoice;
  final voidCallback onTap;

  const QuestionButton({
    required this.answerChoice, required this.onTap
  })
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(onPressed: onTap, child: Text(answerChoice),
      ),
    );
    
  }
}
