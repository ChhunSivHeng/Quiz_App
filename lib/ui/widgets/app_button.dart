import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.label, {
    super.key,
    required this.onTap,
    this.icon,
    this.color,
  });

  final IconData? icon;
  final String label;
  final void Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(
            
            vertical: 40,
            horizontal: 80,
          ),
        ));
  }
}
