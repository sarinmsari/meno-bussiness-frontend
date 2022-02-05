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
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () {
              print("orderbox $index tap");
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
                    _leadingText.toString(),
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
            subtitle: Row(
              children: [
                Text("count: $_itemCount"),
                SizedBox(
                  width: 15,
                ),
                Text("table: ${widget.tableNumber}"),
              ],
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
                print('Order no.$index delivered');
              },
              child: Text(
                roleButtonText,
                style: TextStyle(fontSize: 18, color: roleThemeTextColor),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return Container();
      },
      itemCount: 10,
    );
  }
}
