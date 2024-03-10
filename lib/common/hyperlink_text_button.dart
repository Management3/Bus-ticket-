import "package:flutter/material.dart";

class HyperlinkTextButton extends StatelessWidget {
  const HyperlinkTextButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.18,
        ),
      ),
    );
  }
}
