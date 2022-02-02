import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final _colorDarkGrey = Colors.grey[900];
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu),
        color: _colorDarkGrey,
      ),
      title: Text(
        title,
        style: TextStyle(color: _colorDarkGrey),
      ),
    );
  }
}
