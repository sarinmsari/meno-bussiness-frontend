import 'package:bookkikko_business/components/orders_page/filter_section.dart';
import 'package:bookkikko_business/components/orders_page/order_box.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:flutter/material.dart';
import '../components/orders_page/colorTheme.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int _appliedFilter = 0;
  final String _userRole = 'CASHIER';

//demo variables
  int _tableNum = 5;
//demo variables end

  void setAppliedFilter(value) {
    setState(() {
      _tableNum = value == 0 ? 5 : value;
      _appliedFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    setUserRoleThemeColor(_userRole);
    return Scaffold(
      appBar: CustomAppBar(title: "Orders"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: Column(
          children: [
            SubHeaderSection(
              setAppliedFilter: setAppliedFilter,
              appliedFilter: _appliedFilter,
            ),
            Expanded(
                child: OrderBox(
              tableNumber: _tableNum,
              userRole: _userRole,
            )),
          ],
        ),
      ),
    );
  }
}
