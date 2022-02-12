import 'package:bookkikko_business/components/orders_page/one_order_box.dart';
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
    setLeadingText(widget.userRole);
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return OneOrderBox(
          leadingText: _leadingText,
          itemCount: _itemCount,
          userRole: widget.userRole,
          tableNumber: widget.tableNumber,
          index: index,
        );
      },
      separatorBuilder: (ctx, index) {
        return Container();
      },
      itemCount: 10,
    );
  }
}
