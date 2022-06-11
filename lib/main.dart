import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:bookkikko_business/screens/menu_screen.dart';
import 'package:bookkikko_business/screens/role_form_screen.dart';
import 'package:bookkikko_business/screens/role_screen.dart';
import 'package:flutter/material.dart';

import './screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoleFormPage(),
    );
  }
}
