import 'package:flutter/material.dart';

Color? roleThemeColor;
Color? roleThemeTextColor;
String roleButtonText = '';
Color? rolePrimaryColor;

void setUserRoleThemeColor(String role) {
  switch (role) {
    case 'KITCHEN':
      roleThemeColor = Colors.yellow;
      roleButtonText = 'Prepared';
      roleThemeTextColor = Colors.black87;
      rolePrimaryColor = Colors.black87;
      break;
    case 'WAITER':
      roleThemeColor = Colors.blue;
      roleButtonText = 'Delivered';
      roleThemeTextColor = Colors.white;
      rolePrimaryColor = Colors.blue;
      break;
    case 'CASHIER':
    case 'MANAGER':
    case 'OWNER':
      roleThemeColor = Colors.green;
      roleButtonText = 'Mark Paid';
      roleThemeTextColor = Colors.white;
      rolePrimaryColor = Colors.green;
      break;
    default:
      roleThemeColor = Colors.white;
      roleButtonText = '';
      roleThemeTextColor = Colors.white;
      rolePrimaryColor = Colors.white;
  }
}
