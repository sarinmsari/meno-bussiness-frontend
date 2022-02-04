import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int _appliedFilter = 0;
  final String _userRole = 'MANAGER';

//Dynamic theme to order boxes according to value of variable _userRole
  Color? _roleThemeColor;
  Color? _roleThemeTextColor;
  String _roleButtonText = '';

  void setUserRoleThemeColor() {
    switch (_userRole) {
      case 'KITCHEN':
        setState(() {
          _roleThemeColor = Colors.yellow;
          _roleButtonText = 'Prepared';
          _roleThemeTextColor = Colors.black87;
        });
        break;
      case 'WAITER':
        setState(() {
          _roleThemeColor = Colors.blue;
          _roleButtonText = 'Delivered';
          _roleThemeTextColor = Colors.white;
        });
        break;
      case 'CASHIER':
      case 'MANAGER':
      case 'OWNER':
        setState(() {
          _roleThemeColor = Colors.green;
          _roleButtonText = 'Mark Paid';
          _roleThemeTextColor = Colors.white;
        });
        break;
      default:
        setState(() {
          _roleThemeColor = Colors.white;
          _roleButtonText = '';
          _roleThemeTextColor = Colors.white;
        });
    }
  }
  //Dynamic theme set section end

  @override
  Widget build(BuildContext context) {
    setUserRoleThemeColor();
    return Scaffold(
      appBar: CustomAppBar(title: "Orders"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: Row(
                children: [
                  Text(
                    _appliedFilter == 0 ? 'All' : 'Table $_appliedFilter',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('All'),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: Text('Table 1'),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text('Table 2'),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Table 3'),
                        value: 3,
                      ),
                      PopupMenuItem(
                        child: Text('Table 4'),
                        value: 4,
                      ),
                      PopupMenuItem(
                        child: Text('Table 5'),
                        value: 5,
                      ),
                    ],
                    onSelected: (int value) {
                      setState(() {
                        _appliedFilter = value;
                      });
                    },
                    child: Row(
                      children: const [
                        Text(
                          "filter",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.blue,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
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
                          color: _roleThemeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text(
                          '5',
                          style: TextStyle(
                              fontSize: 35,
                              color: _roleThemeTextColor,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      title: Text(
                        "Chicken Biriyani",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      subtitle: Row(
                        children: [
                          Text("count: 3"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("table: 5"),
                        ],
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _roleThemeColor,
                          padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print('Order no.$index delivered');
                        },
                        child: Text(
                          _roleButtonText,
                          style: TextStyle(
                              fontSize: 18, color: _roleThemeTextColor),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Container();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
