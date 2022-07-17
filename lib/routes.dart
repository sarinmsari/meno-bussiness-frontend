import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/error_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:bookkikko_business/screens/menu_screen.dart';
import 'package:bookkikko_business/screens/orders_screen.dart';
import 'package:bookkikko_business/screens/role_form_screen.dart';
import 'package:bookkikko_business/screens/role_screen.dart';
import 'package:bookkikko_business/screens/settings_screen.dart';
import 'package:bookkikko_business/screens/signin_screen.dart';
import 'package:bookkikko_business/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookkikko_business/authentication/auth_global_credentials.dart'
    as auth_globals;

Route<dynamic> userRouteGenerator(RouteSettings settings) {
  auth_globals.fetchUserFromFirebase();
  if (auth_globals.user != null) {
    switch (settings.name) {
      case "/signin_screen":
      case "signin_screen":
        return MaterialPageRoute(builder: (ctx) => SignInScreen());
      case "/splash_screen":
      case "splash_screen":
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case "/order_screen":
      case "order_screen":
        return MaterialPageRoute(builder: (ctx) => OrderScreen());
      case "/role_screen":
      case "role_screen":
        return MaterialPageRoute(builder: (ctx) => RoleScreen());
      case "/menu_screen":
      case "menu_screen":
        return MaterialPageRoute(builder: (ctx) => MenuScreen());
      case "/individual_role_screen":
      case "individual_role_screen":
        // do something
        final args = settings.arguments as IndividualRoleScreenArguments;
        return MaterialPageRoute(
          builder: (ctx) => IndividualRoleScreen(roleName: args.roleName),
        );
      case "/role_form_screen":
      case "role_form_screen":
        final args = settings.arguments as RoleFormScreenArguments;
        return MaterialPageRoute(
            builder: (ctx) => RoleFormScreen(
                  roleName: args.roleName,
                  callback: args.callback,
                ));
      // navigate to role_form_screen
      case "/settings_screen":
      case "settings_screen":
        return MaterialPageRoute(builder: (ctx) => SettingsScreen());
      default:
        print(settings.name);
        return MaterialPageRoute(builder: (ctx) => ErrorScreen());
    }
  } else {
    return MaterialPageRoute(builder: (ctx) => SignInScreen());
  }

  throw Exception("Switch case in main page didn't work");
}
