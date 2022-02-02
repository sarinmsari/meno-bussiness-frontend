import 'package:bookkikko_business/components/drawer_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawyerPage extends StatefulWidget {
  DrawyerPage({Key? key}) : super(key: key);

  @override
  State<DrawyerPage> createState() => _DrawyerPageState();
}

class _DrawyerPageState extends State<DrawyerPage> {
  final String mainAppName = "M E N O";

  final String subAppName = "Business";

  bool _isOpen = true;
  String _status = "Open";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mainAppName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      subAppName,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // row1 for name , switch indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ithathas Kitchen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: _isOpen,
                            activeColor: Colors.green.shade300,
                            onChanged: (val) {
                              setState(() {
                                _isOpen = val;
                              });
                              if (_isOpen)
                                _status = "open";
                              else
                                _status = "closed";
                              // print(_isOpen.toString());
                            },
                          ),
                        )
                      ],
                    ),
                    // row2 for close time and statuss
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Closes at 9.00pm",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            _status,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomDevider(),
                    CustomDrawerButton(
                      title: "Orders",
                      icon: Icons.shopping_basket_outlined,
                      route: "/home_page",
                    ),
                    CustomDrawerButton(
                      title: "Menu",
                      icon: Icons.fastfood_outlined,
                      route: "/scanqr_page",
                    ),
                    CustomDrawerButton(
                      title: "Revenew",
                      icon: Icons.attach_money_outlined,
                      route: "/locatenearby_page",
                    ),
                    CustomDrawerButton(
                      title: "Statitics",
                      icon: Icons.data_usage_outlined,
                      route: "/favorites_page",
                    ),
                    CustomDrawerButton(
                      title: "Roles",
                      icon: Icons.group_outlined,
                      route: "/orders_page",
                    ),
                    CustomDrawerButton(
                      title: "Settings",
                      icon: Icons.settings_outlined,
                      devider: false,
                      route: "/settings_page",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
