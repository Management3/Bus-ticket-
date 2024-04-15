import 'package:ezy_transport/common/widgets/search_bottom_sheet.dart';
import 'package:flutter/material.dart';

class TravelDetailCard extends StatefulWidget {
  const TravelDetailCard({
    super.key,
    required this.child,
    this.secondChild,
    this.showButton = false,
  });

  final Widget child;
  final Widget? secondChild;
  final bool showButton;

  @override
  State<TravelDetailCard> createState() => _TravelDetailCardState();
}

class _TravelDetailCardState extends State<TravelDetailCard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: screenHeight / 5,
      left: screenWidth / 15,
      right: screenWidth / 15,
      child: Stack(children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: screenHeight / 8,
              width: double.infinity,
              child: widget.child,
            ),
            SizedBox(
              height: screenHeight / 3,
              child: widget.secondChild,
            )
          ],
        ),
        if (widget.showButton)
          Positioned(
            top: screenHeight / 10.5,
            left: screenWidth / 4,
            right: screenWidth / 4,
            child: ElevatedButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color(0xFFfad309),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const SearchBottomSheet(),
                );
              },
              child: const Text("Search"),
            ),
          ),
      ]),
    );
  }
}
