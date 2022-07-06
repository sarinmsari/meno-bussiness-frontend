import 'package:bookkikko_business/components/orders_page/one_order_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './colorTheme.dart';

class OrderBox extends StatefulWidget {
  const OrderBox({Key? key, required this.tableNumber, required this.userRole})
      : super(key: key);

  final String userRole;
  final int tableNumber;

  @override
  _OrderBoxState createState() => _OrderBoxState();
}

class _OrderBoxState extends State<OrderBox> {
  //demo variables
  final int _itemCount = 3;
  final int _orderTotalAmount = 1200;
  int _leadingText = 0;

//demo variables end

//Dynamic innertext for leading section
  void setLeadingText(String role) {
    switch (role) {
      case 'KITCHEN':
        setState(() {
          _leadingText = _itemCount;
        });
        break;
      case 'WAITER':
        setState(() {
          _leadingText = widget.tableNumber;
        });
        break;
      case 'CASHIER':
      case 'MANAGER':
      case 'OWNER':
        setState(() {
          _leadingText = _orderTotalAmount;
        });
        break;
      default:
        setState(() {
          _leadingText = 0;
        });
    }
  }
//Dynamic innertext for leading section end

  @override
  Widget build(BuildContext context) {
    // initializing the stream object
    Stream<QuerySnapshot> orderStream =
        FirebaseFirestore.instance.collection("orders").snapshots();

    setLeadingText(widget.userRole);
    // print(orderStream);

    return StreamBuilder<QuerySnapshot>(
        stream: orderStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<Widget> resultList = <Widget>[];
          if (snapshot.hasError) {
            return Align(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              child: CircularProgressIndicator(),
            );
          }

          // print(snapshot.data!.docs[0].data() as Map);

          snapshot.data!.docs.forEach((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            //data is map
            // print("doc is : " + document.toString());
            (data["items"] as List).forEach(
              (item) => resultList.add(
                OneOrderBox(
                  leadingText: int.parse(item["quantity"]),
                  contentText: item["item_id"],
                  itemCount: int.parse(item["quantity"]),
                  userRole: widget.userRole,
                  tableNumber: widget.tableNumber,
                  index: 1,
                ),
              ),
            );
          });

          return ListView(
            children: resultList,
          );

          // return Align(child: Text("Loading..."));

          // return ListView.separated(
          //   itemBuilder: (ctx, index) {
          //     return OneOrderBox(
          //       leadingText: _leadingText,
          //       itemCount: _itemCount,
          //       userRole: widget.userRole,
          //       tableNumber: widget.tableNumber,
          //       index: index,
          //     );
          //   },
          //   separatorBuilder: (ctx, index) {
          //     return Container();
          //   },
          //   itemCount: 10,
          // );
        });
  }
}
