import 'package:flutter/material.dart';

Color? roleThemeButtonColor;
Color? roleThemeLeadingBgColor;
Color? roleThemeButtonTextColor;
Color? roleThemeLeadingTextColor;
String roleButtonText = '';
Color? rolePrimaryColor;

void setUserRoleThemeColor(String role) {
  switch (role) {
    case 'KITCHEN':
      roleThemeButtonColor = Colors.yellow;
      roleThemeLeadingBgColor = Colors.yellow;
      roleButtonText = 'Prepared';
      roleThemeButtonTextColor = Colors.black87;
      roleThemeLeadingTextColor = Colors.black87;
      rolePrimaryColor = Colors.black87;
      break;
    case 'WAITER':
      roleThemeButtonColor = Colors.blue;
      roleThemeLeadingBgColor = Colors.blue;
      roleButtonText = 'Delivered';
      roleThemeButtonTextColor = Colors.white;
      roleThemeLeadingTextColor = Colors.white;
      rolePrimaryColor = Colors.blue;
      break;
    case 'CASHIER':
    case 'MANAGER':
    case 'OWNER':
      roleThemeButtonColor = Colors.green;
      roleThemeLeadingBgColor = Colors.white24;
      roleButtonText = 'Mark Paid';
      roleThemeButtonTextColor = Colors.white;
      roleThemeLeadingTextColor = Colors.green;
      rolePrimaryColor = Colors.green;
      rolePrimaryColor = Colors.green;
      break;
    default:
      roleThemeButtonColor = Colors.white;
      roleButtonText = '';
      roleThemeButtonTextColor = Colors.white;
      roleThemeLeadingTextColor = Colors.white;
      rolePrimaryColor = Colors.white;
  }
}
