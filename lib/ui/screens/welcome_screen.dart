import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/theme/theme.dart';
import '../widgets/app_button.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/quiz-logo.png',
                width: 240,
              ),
              const SizedBox(height: 30),
              AppButton(
                'Start Quiz',
                icon: Icons.quiz,
                onTap: () {},
          
              ),
            ],
          ),
        )

      
      ),
    );
  }
}
