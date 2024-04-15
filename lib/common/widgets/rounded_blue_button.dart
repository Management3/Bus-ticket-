import 'package:flutter/material.dart';

class RoundedBlueButton extends StatelessWidget {
  const RoundedBlueButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(
          16,
        ),
        backgroundColor: const Color(0xFF0094FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBackgroundColor: const Color(0xFF0094FF).withOpacity(0.72),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
