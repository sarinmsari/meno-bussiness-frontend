import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget(
      {Key? key,
      required this.userRole,
      required this.itemCount,
      required this.tableNumber,
      required this.displayMoreDetails,
      required this.isDownButton})
      : super(key: key);
  final String userRole;
  final itemCount;
  final tableNumber;
  final bool isDownButton;
  final Function() displayMoreDetails;

  @override
  Widget build(BuildContext context) {
    if (userRole == "CASHIER" ||
        userRole == "MANAGER" ||
        userRole ==
            "OWNER") // other user roles that need dropdown should be added here
      return InkWell(
        onTap: () {
          // print("more details");
          displayMoreDetails();
        },
        child: Row(
          children: [
            Text("More Details "),
            SizedBox(
              width: 5,
            ),
            Icon(isDownButton
                ? Icons.arrow_drop_down_sharp
                : Icons.arrow_drop_up_sharp),
          ],
        ),
      );
    else
      return Row(
        children: [
          Text("count: $itemCount "),
          SizedBox(
            width: 15,
          ),
          Text("table: $tableNumber"),
        ],
      );
  }
}
