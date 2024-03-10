import "package:ezy_transport/common/constants.dart";
import "package:flutter/material.dart";

class QuestionText extends StatelessWidget {
  const QuestionText({
    required this.text,
    super.key,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kQuestionTextStyle,
    );
  }
}
