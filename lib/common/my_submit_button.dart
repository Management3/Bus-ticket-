import "package:flutter/material.dart";

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(
            16,
          ),
          backgroundColor: const Color(0xFFFAD309),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBackgroundColor: const Color(0xFFE6B014).withOpacity(0.72),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
