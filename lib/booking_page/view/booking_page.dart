import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/widgets/rounded_blue_button.dart';
import 'package:ezy_transport/common/widgets/travel_detail_card.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedSeats = 2; // Default value for selected seats

  Future<void> buildSeatsModalBottomSheet(BuildContext context) async {
    final int? selectedSeats = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 10, // Assuming a max of 10 seats for simplicity
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${index + 1} Seats'),
              onTap: () {
                Navigator.pop(context, index + 1);
              },
            );
          },
        );
      },
    );

    if (selectedSeats != null) {
      setState(() {
        _selectedSeats = selectedSeats;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Corrected MediaQuery usage
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFf4f4f4),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Blue background with logo
                Container(
                  color: const Color(0xFF0094FF),
                  height: screenHeight / 4,
                  width: double.infinity,
                  child: Image.asset(
                    "images/ezy_logo_white.png",
                  ),
                ),
                // Space
                SizedBox(
                  height: screenHeight / 8,
                ),
                // Table of locations and seats info
                SizedBox(
                  height: screenHeight / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RoundedBlueButton(
                          onPressed: () {
                            buildSeatsModalBottomSheet(context);
                          },
                          label: "Select Seat(s)",
                        ),
                      ),
                      GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth / 10,
                            vertical: screenHeight / 25,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            String title = "";
                            String value = "";
                            switch (index) {
                              case 0:
                                title = "Available";
                                value = "20";
                                break; // Make sure to add break statements
                              case 1:
                                title = "Booked";
                                value = "27";
                                break;
                              case 2:
                                title = "No. Of Seats";
                                value = _selectedSeats
                                    .toString(); // Updated to show selected seats
                                break;
                            }
                            return Column(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  width: screenWidth / 4.5,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0094FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: RoundedBlueButton(
                          onPressed: () {
                            context.pushRoute(
                              const PaymentRoute(),
                            );
                          },
                          label: "Proceed To Book",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Travel details
            TravelDetailCard(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 10,
                    vertical: screenHeight / 25,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    var title = "";
                    var value = "";
                    switch (index) {
                      case 0:
                        title = "From";
                        value = "SUNYANI";
                        break;
                      case 1:
                        title = "To";
                        value = "ACCRA";
                        break;
                      case 2:
                        title = "Travel Date";
                        value = "31-03-2024";
                        break;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            // Back button on top left
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: Icon(
                    Icons.adaptive.arrow_back,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
