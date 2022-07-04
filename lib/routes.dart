import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/error_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:bookkikko_business/screens/menu_screen.dart';
import 'package:bookkikko_business/screens/orders_screen.dart';
import 'package:bookkikko_business/screens/role_form_screen.dart';
import 'package:bookkikko_business/screens/role_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> userRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case "/order_screen":
      return MaterialPageRoute(builder: (ctx) => OrderScreen());
    case "/role_screen":
      return MaterialPageRoute(builder: (ctx) => RoleScreen());
    case "/menu_screen":
      return MaterialPageRoute(builder: (ctx) => MenuScreen());
    case "/individual_role_screen":
      // do something
      final args = settings.arguments as IndividualRoleScreenArguments;
      return MaterialPageRoute(
        builder: (ctx) => IndividualRoleScreen(roleName: args.roleName),
      );
    case "/role_form_screen":
      final args = settings.arguments as RoleFormScreenArguments;
      return MaterialPageRoute(
          builder: (ctx) => RoleFormScreen(
                roleName: args.roleName,
              ));
    // navigate to role_form_screen
    default:
      return MaterialPageRoute(builder: (ctx) => ErrorScreen());
  }

  throw Exception("Switch case in main page didn't work");
}
