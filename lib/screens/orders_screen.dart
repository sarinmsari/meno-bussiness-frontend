import 'package:bookkikko_business/components/orders_page/filter_section.dart';
import 'package:bookkikko_business/components/orders_page/order_box.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:flutter/material.dart';
import '../components/orders_page/colorTheme.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _appliedFilter = 0;
  final String _userRole = 'cashier'.toUpperCase();

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
    // print("order screen is built");
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
