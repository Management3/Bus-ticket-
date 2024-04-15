import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/constants.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class ScrollableTable extends StatelessWidget {
  const ScrollableTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              //Table Heading
              const TableRow(
                decoration: BoxDecoration(color: Color(0xFF0094FF)),
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "#",
                      style: kTableHeadTextStyle,
                    ),
                  )),
                  TableCell(
                      child: Text(
                    "From",
                    style: kTableHeadTextStyle,
                  )),
                  TableCell(
                      child: Text(
                    "To",
                    style: kTableHeadTextStyle,
                  )),
                  TableCell(
                      child: Text(
                    "Time",
                    style: kTableHeadTextStyle,
                  )),
                  TableCell(
                      child: Text(
                    "Fare (GHS)",
                    style: kTableHeadTextStyle,
                  )),
                  TableCell(child: Text("")),
                ],
              ),
              //Actual table contents
              ...List.generate(
                15,
                (index) => TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("$index"),
                      ),
                    ),
                    const TableCell(
                      child: Text("Accra"),
                    ),
                    const TableCell(
                      child: FittedBox(child: Text("Sunyani  ")),
                    ),
                    const TableCell(
                      child: FittedBox(
                        child: Text("6:30 am  "),
                      ),
                    ),
                    const TableCell(
                      child: Text("150.00"),
                    ),
                    TableCell(
                      child: FittedBox(
                        child: GestureDetector(
                          onTap: () {
                            context.pushRoute(const BookingRoute());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: const Color(0xFF0094FF),
                            child: const Text(
                              "Book Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
