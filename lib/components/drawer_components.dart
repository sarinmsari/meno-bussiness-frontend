import 'package:bookkikko_business/global_components.dart';
import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  CustomDrawerButton({
    Key? key,
    required this.title,
    required this.icon,
    this.devider = true,
    required this.route,
  }) : super(key: key);
  final String title;
  final IconData icon;

  final Color _fontColor = Colors.white;
  final Color _fontColor2 = Colors.white30;
  final bool? devider;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: _fontColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: _fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          if (devider!) CustomDevider(),
        ],
      ),
    );
  }
}
