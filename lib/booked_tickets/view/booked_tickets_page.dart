import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/widgets/my_card.dart';
import 'package:ezy_transport/common/widgets/rounded_blue_button.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookedTicketsPage extends StatelessWidget {
  const BookedTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SafeArea(
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
              RoundedBlueButton(
                onPressed: () {
                  context.router.pushAndPopUntil(
                    const DashboardRoute(),
                    predicate: (_) => false,
                  );
                },
                label: "Book Now",
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Booked Tickets",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0094FF),
                ),
              ),
              Text(
                "No Ticket Booked Yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF78898B),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
