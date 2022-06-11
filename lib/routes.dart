import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:bookkikko_business/screens/menu_screen.dart';
import 'package:bookkikko_business/screens/orders_screen.dart';
import 'package:bookkikko_business/screens/role_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> userRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case "/order_screen":
      final args = settings.arguments;
      return MaterialPageRoute(builder: (ctx) => OrderScreen());
    case "/role_screen":
      final args = settings.arguments as RoleScreenArguments;
      return MaterialPageRoute(
          builder: (ctx) => RoleScreen(
                roleName: args.roleName,
              ));
    case "/menu_screen":
      return MaterialPageRoute(builder: (ctx) => MenuScreen());
    case "/individual_role_screen":
      // do something
      final args = settings.arguments as IndividualRoleScreenArguments;
      return MaterialPageRoute(
        builder: (ctx) => IndividualRoleScreen(roleName: args.roleName),
      );

    default:
      return MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: CustomAppBar(title: "Error"),
          drawer: DrawyerPage(),
          body: SafeArea(
            child: Center(
              child: Text("Invalid route or page not found"),
            ),
          ),
        ),
      );
  }

  throw Exception("Switch case in main page didn't work");
}
