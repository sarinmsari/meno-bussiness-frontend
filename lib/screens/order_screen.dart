import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/order_screen_components.dart';
import 'package:bookkikko_business/components/ordercard.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key, this.isForWaiter = true}) : super(key: key);
  bool? isForWaiter;
  final Color colorForWaitor = Colors.blue;
  final Color colorForCook = Colors.yellow;
  final String textForWaitor = "Delivered";
  final String textForCook = "Prepared";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(title: "M E N O Business"),
      drawer: DrawyerPage(),
      body: Column(
        children: [
          FilterBy(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) => OrderCard(
                isForWaiter: isForWaiter,
                colorForWaitor: colorForWaitor,
                colorForCook: colorForCook,
                textForWaitor: textForWaitor,
                textForCook: textForCook,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
