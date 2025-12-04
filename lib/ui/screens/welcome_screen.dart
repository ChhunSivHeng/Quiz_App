import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/theme/theme.dart';
import '../widgets/app_button.dart';



class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});

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
                icon: Icons.play_arrow,
                'Start Quiz', 
                onTap: onStart,
                )
            ],
          ),
        )    
      ),
    );
  }
}
