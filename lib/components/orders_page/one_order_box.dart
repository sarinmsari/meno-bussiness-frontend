import 'package:bookkikko_business/components/orders_page/colorTheme.dart';
import 'package:bookkikko_business/components/orders_page/sub_title_widget.dart';
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
  final tableNumber;
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
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // color: Colors.grey,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              print("orderbox ${widget.index} tap");
            },
            leading: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: roleThemeColor,
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
                      color: roleThemeTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              "Chicken Biriyani",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            subtitle: SubTitleWidget(
              userRole: widget.userRole,
              tableNumber: widget.tableNumber,
              itemCount: widget.itemCount,
              isDownButton: !_viewMoreDetails,
              displayMoreDetails: displayMoreDetails,
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: roleThemeColor,
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
                style: TextStyle(fontSize: 18, color: roleThemeTextColor),
              ),
            ),
          ),
          if (_viewMoreDetails)
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.green,
            )
        ],
      ),
    );
  }
}
