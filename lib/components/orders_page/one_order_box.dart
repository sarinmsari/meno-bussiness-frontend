import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/orders_page/colorTheme.dart';
import 'package:bookkikko_business/components/orders_page/sub_title_widget.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:flutter/material.dart';

class OneOrderBox extends StatefulWidget {
  const OneOrderBox(
      {Key? key,
      required this.leadingText,
      required this.itemCount,
      required this.userRole,
      required this.tableNumber,
      required this.index})
      : super(key: key);

  final int leadingText;
  final String userRole;
  final int index;
  final int tableNumber;
  final int itemCount;

  @override
  State<OneOrderBox> createState() => _OneOrderBoxState();
}

class _OneOrderBoxState extends State<OneOrderBox> {
  bool _viewMoreDetails = false;
  void displayMoreDetails() {
    setState(() {
      _viewMoreDetails = !_viewMoreDetails;
    });
    // print(_viewMoreDetails);
  }

  @override
  Widget build(BuildContext context) {
    return OneOrderBoxSkelton(
      leading: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: roleThemeLeadingBgColor,
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.leadingText.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: roleThemeLeadingTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
      ),
      titleText: "ChickenBiriyani",
      subtitle: SubTitleWidget(
        userRole: widget.userRole,
        tableNumber: widget.tableNumber,
        itemCount: widget.itemCount,
        isDownButton: !_viewMoreDetails,
        displayMoreDetails: displayMoreDetails,
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: roleThemeButtonColor,
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          print('Order no.${widget.index} delivered');
        },
        child: Text(
          roleButtonText,
          style: TextStyle(fontSize: 18, color: roleThemeButtonTextColor),
        ),
      ),
      lowerChild: (_viewMoreDetails)
          ? Container(
              width: double.infinity,
              // color: Colors.green,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    "10/11/2022",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Table No : 1"),
                      Text("10.30"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CHCKEN BIRIYANI"),
                      Text("10 X 120 INR"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total "),
                      Text("1200 INR"),
                    ],
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
