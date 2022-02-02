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
                              fontWeight: FontWeight.bold),
                        ),
                        CupertinoSwitch(
                            value: _isOpen,
                            activeColor: Colors.green.shade300,
                            onChanged: (val) {
                              setState(() {
                                _isOpen = val;
                              });
                              if (_isOpen)
                                _status = "Open";
                              else
                                _status = "Closed";
                              // print(_isOpen.toString());
                            })
                      ],
                    ),
                    // row2 for close time and status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Closes at 9.00pm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _status,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    CustomDevider(),
                    CustomDrawerButton(
                      title: "Orders",
                      icon: Icons.shopping_bag,
                      route: "/home_page",
                    ),
                    CustomDrawerButton(
                      title: "Menu",
                      icon: Icons.book,
                      route: "/scanqr_page",
                    ),
                    CustomDrawerButton(
                      title: "Revenew",
                      icon: Icons.money,
                      route: "/locatenearby_page",
                    ),
                    CustomDrawerButton(
                      title: "Statitics",
                      icon: Icons.graphic_eq,
                      route: "/favorites_page",
                    ),
                    CustomDrawerButton(
                      title: "Roles",
                      icon: Icons.person,
                      route: "/orders_page",
                    ),
                    CustomDrawerButton(
                      title: "Settings",
                      icon: Icons.settings,
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
