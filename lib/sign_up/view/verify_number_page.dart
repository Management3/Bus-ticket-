import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/widgets/my_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerifyNumberPage extends StatefulWidget {
  const VerifyNumberPage({Key? key}) : super(key: key);

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFf4f4f4),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: const Color(0xFF0094FF),
                height: screenHeight / 4,
                width: double.infinity,
                child: Image.asset(
                  "images/ezy_logo_white.png",
                ),
              ),
            ],
          ),
          MyCard(
            secondChild: Column(
              children: [
                Text("data"),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0094FF),
                  ),
                ),
                Image.asset("images/phone_image.png"),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
