import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  const CenteredText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(text),
    );
  }
}
