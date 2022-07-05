import 'package:bookkikko_business/components/menu_screen_components/alert_box_components.dart';
import 'package:flutter/material.dart';

class MenuItemAlertDialog extends StatelessWidget {
  const MenuItemAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialogBoxLayout(
      title: "Add new item",
      columnChildren: [
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Item name',
          ),
        ),
        SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Item price',
          ),
          keyboardType: TextInputType.number,
        ),
        PopupMenuButton(
          child: Icon(Icons.menu),
          itemBuilder: (ctx) => <PopupMenuItem>[
            PopupMenuItem(
              child: Text("item1"),
              value: 0,
            ),
            PopupMenuItem(
              child: Text("item2"),
              value: 0,
            ),
            PopupMenuItem(
              child: Text("item3"),
              value: 0,
            ),
            PopupMenuItem(
              child: Text("item4"),
              value: 0,
            ),
            PopupMenuItem(
              child: Text("item5"),
              value: 0,
            ),
          ],
        ),
        Row(
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MenuCategoryAlertDialog extends StatelessWidget {
  const MenuCategoryAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialogBoxLayout(
      title: "Add new category",
      columnChildren: [
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Categoroy name',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AlertBoxCancelAddButton(onAddPress: () {
          Navigator.pop(context);
        }, onCancelPress: () {
          Navigator.pop(context);
        })
      ],
    );
  }
}
