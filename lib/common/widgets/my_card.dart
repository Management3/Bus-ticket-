import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child, this.secondChild});

  final Widget child;
  final Widget? secondChild;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: screenHeight / 5,
      left: screenWidth / 15,
      right: screenWidth / 15,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            height: screenHeight / 3,
            width: double.infinity,
            child: child,
          ),
          SizedBox(
            height: screenHeight / 3,
            child: secondChild,
          )
        ],
      ),
    );
  }
}
