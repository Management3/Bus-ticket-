import 'package:ezy_transport/common/widgets/travel_detail_card.dart';
import 'package:ezy_transport/dashboard/components/scrollable_table.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
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
              child: const ScrollableTable(),
            ),
          ],
        ),
        Stack(children: [
          TravelDetailCard(
            showButton: true,
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
                    case 1:
                      title = "To";
                      value = "ACCRA";
                    case 2:
                      title = "Travel Date";
                      value = "31-03-2024";
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
        ]),
        //menu button
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}
