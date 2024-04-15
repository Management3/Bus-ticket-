import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/my_submit_button.dart';
import 'package:ezy_transport/common/widgets/travel_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf4f4f4),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //blue background with logo
                Container(
                  color: const Color(0xFF0094FF),
                  height: screenHeight / 4,
                  width: double.infinity,
                  child: Image.asset(
                    "images/ezy_logo_white.png",
                  ),
                ),
                //space
                SizedBox(
                  height: screenHeight / 8,
                ),
                //table of locations
                SizedBox(
                  height: screenHeight / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IntlPhoneField(
                          decoration: const InputDecoration(
                            labelText: 'Enter MoMo number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: "GH",
                          onChanged: (phone) {
                            //print(phone.completeNumber);
                          },
                        ),
                      ),
                      const Text(
                        "Total cost is: GHS 300",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      MySubmitButton(
                        label: "Pay Now",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    title: const FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Payment Successful",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    content: Lottie.asset("images/success.json",
                                        repeat: false,
                                        height: screenHeight / 6),
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          MySubmitButton(
                                              onPressed: () {
                                                context.popRoute();
                                              },
                                              label: "Done"),
                                        ],
                                      ),
                                    ],
                                    actionsAlignment: MainAxisAlignment.center,
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(children: [
              TravelDetailCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0094FF),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset("images/payment.svg")
                  ],
                ),
              ),
            ]),
            //back button on top left
            IconButton(
                onPressed: () {
                  context.popRoute();
                },
                icon: Icon(
                  Icons.adaptive.arrow_back,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
