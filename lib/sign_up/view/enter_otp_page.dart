import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/my_text_filled/components/generic_text_field.dart';
import 'package:ezy_transport/common/widgets/my_card.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EnterOTPPage extends StatefulWidget {
  const EnterOTPPage({Key? key}) : super(key: key);

  @override
  State<EnterOTPPage> createState() => _EnterOTPPageState();
}

class _EnterOTPPageState extends State<EnterOTPPage> {
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
                  "Enter OTP Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF78898B),
                    fontSize: 18,
                  ),
                ),
                const GenericTextField(
                  obscureText: false,
                  hintText: "Enter 4 digit Code",
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.pushAndPopUntil(
                      const DashboardRoute(),
                      predicate: (_) => false,
                    );
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
                    "Verify",
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
