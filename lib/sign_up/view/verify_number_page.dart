import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/my_text_filled/components/generic_text_field.dart';
import 'package:ezy_transport/common/widgets/my_card.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "We will send you a One Time\nPassword on your phone number",
                  style: TextStyle(
                    color: Color(0xFF78898B),
                    fontSize: 18,
                  ),
                ),
                const GenericTextField(
                  obscureText: false,
                  hintText: "Enter Phone Number",
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushRoute(const EnterOTPRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    backgroundColor: const Color(0xFF0094FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBackgroundColor:
                        const Color(0xFF0094FF).withOpacity(0.72),
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
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
