import "package:flutter/material.dart";

const kQuestionTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFFF5F5F5),
  fontWeight: FontWeight.w700,
  letterSpacing: 0.18,
);

const kPageDescriptionStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  color: Color(0xFFF5F5F5),
  letterSpacing: 0.18,
);

const kTableHeadTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFFF5F5F5),
);

Future<dynamic> buildSearchModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) => Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SearchBar(
            hintText: "Search and book",
            leading: const Icon(Icons.search),
            onChanged: (value) {
              print(value);
            },
          ),
        ),
      ],
    ),
  );
}

Future<dynamic> buildSeatsModalBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) => Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(),
        ),
      ],
    ),
  );
}
