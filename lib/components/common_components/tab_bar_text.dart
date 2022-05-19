import 'package:flutter/material.dart';

class TabBarText extends StatelessWidget {
  const TabBarText(
    this.text, {
    Key? key,
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black87, fontSize: 16),
    );
  }
}
