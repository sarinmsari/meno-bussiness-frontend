import 'package:flutter/material.dart';

class CustomDialogBoxLayout extends StatelessWidget {
  CustomDialogBoxLayout({Key? key, required this.columnChildren, this.title})
      : super(key: key);
  final List<Widget> columnChildren;
  String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Center(child: Text(title!)) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: columnChildren,
      ),
    );
  }
}

class AlertBoxCancelAddButton extends StatelessWidget {
  const AlertBoxCancelAddButton(
      {Key? key, required this.onAddPress, required this.onCancelPress})
      : super(key: key);
  final Function()? onAddPress;
  final Function()? onCancelPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onCancelPress,
            child: Text("Cancel"),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onAddPress,
            child: Text("Add"),
          ),
        ),
      ],
    );
  }
}
