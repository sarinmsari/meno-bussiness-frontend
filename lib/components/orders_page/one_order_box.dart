import 'dart:math';

import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/orders_page/colorTheme.dart';
import 'package:bookkikko_business/components/orders_page/sub_title_widget.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OneOrderBox extends StatefulWidget {
  const OneOrderBox(
      {Key? key,
      required this.leadingText,
      this.itemCount,
      required this.userRole,
      required this.tableNumber,
      required this.index,
      required this.contentText,
      this.data,
      this.totalPrice})
      : super(key: key);

  final int leadingText;
  final String userRole;
  final String contentText;
  final int index;
  final int tableNumber;
  final int? itemCount;
  final List? data;
  final String? totalPrice;

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

  List<Widget> arrangeMoreDetailsItems() {
    List<Widget> resultList = [];
    if (widget.data != null)
      widget.data!.forEach((element) {
        resultList.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element["item_id"].toString()),
              Text("${element['quantity']} X ${element['one_item_price']} INR"),
            ],
          ),
        );
      });
    else
      print("no data found for more details to get");

    return resultList;
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
      titleText: widget.contentText,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("CHCKEN BIRIYANI"),
                  //     Text("10 X 120 INR"),
                  //   ],
                  // ),
                  Column(
                    children: arrangeMoreDetailsItems(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total "),
                      (widget.totalPrice != null)
                          ? Text("${widget.totalPrice} INR")
                          : Text("error occured"),
                    ],
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
