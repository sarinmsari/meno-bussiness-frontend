import 'package:flutter/material.dart';

const RESTAURANT_ID = "112233";

class CustomDevider extends StatelessWidget {
  CustomDevider({
    Key? key,
  }) : super(key: key);

  final Color _fontColor = Colors.white;
  final Color _fontColor2 = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, 0), // near the top right
          radius: 100,
          colors: <Color>[
            _fontColor, // yellow sun
            _fontColor2
          ],
          stops: <double>[.01, 1],
        ),
      ),
      width: double.infinity,
      height: 1,
    );
  }
}
