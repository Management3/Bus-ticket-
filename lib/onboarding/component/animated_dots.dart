import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.yellow
            : const Color(0xFF868686).withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
