import 'package:bookkikko_business/components/menu_screen_components/alert_box_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuItemAlertDialog extends StatefulWidget {
  MenuItemAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItemAlertDialog> createState() => _MenuItemAlertDialogState();
}

class _MenuItemAlertDialogState extends State<MenuItemAlertDialog> {
  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  String? categoryValue;

  String hintText = "Choose a category";

  @override
  Widget build(BuildContext context) {
    return CustomDialogBoxLayout(
      title: "Add new item",
      columnChildren: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Item name',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: priceController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Item price',
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: categoryRef
                .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                .limit(1)
                .get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return Align(child: Text("Something went wrong"));
              if (snapshot.hasData && !snapshot.data!.docs[0].exists)
                return Align(
                  child: Text("Data not found"),
                );
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> snapshotData =
                    snapshot.data!.docs[0].data() as Map<String, dynamic>;

                List<PopupMenuItem> popupMenuList = [];
                snapshotData["category"].forEach((item) {
                  popupMenuList.add(
                    PopupMenuItem(
                      child: Text(item["category_name"]),
                      value: item["category_name"],
                    ),
                  );
                });

                return PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        categoryValue = value.toString();
                        hintText = value.toString();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          hintText,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    itemBuilder: (ctx) => popupMenuList);
              }
              return Align(
                child: CircularProgressIndicator(),
              );
            }),
        SizedBox(
          height: 10,
        ),
        AlertBoxCancelAddButton(onAddPress: () {
          Navigator.pop(context);
          menuRef
              .where("restaurant_id", isEqualTo: RESTAURANT_ID)
              .limit(1)
              .get()
              .then((value) {
            Map<String, dynamic> data =
                value.docs[0].data() as Map<String, dynamic>;
            List listRef = data["items"];
            listRef.add({
              "item_id": "item111",
              "item_name": nameController.text,
              "item_category": categoryValue,
              "item_price": priceController.text,
              "item_rating": "",
              "item_created_date": "2019-05-28"
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("successfully added"),
              backgroundColor: Color.fromARGB(255, 51, 217, 57),
            ));

            value.docs[0].reference.update({"items": listRef});
          }).onError((error, stackTrace) {
            menuRef.doc(RESTAURANT_ID).set({
              "item_id": "item111",
              "item_name": nameController.text,
              "item_category": categoryValue,
              "item_price": priceController.text,
              "item_rating": "",
              "item_created_date": "2019-05-28"
            });
            // document not found
          });
        }, onCancelPress: () {
          Navigator.pop(context);
        })
      ],
    );
  }
}

class MenuCategoryAlertDialog extends StatelessWidget {
  MenuCategoryAlertDialog({Key? key}) : super(key: key);
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomDialogBoxLayout(
      title: "Add new category",
      columnChildren: [
        TextField(
          controller: categoryController,
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
          var db = FirebaseFirestore.instance;
          CollectionReference collection = db.collection("categories");
          collection
              .where("restaurant_id", isEqualTo: RESTAURANT_ID)
              .limit(1)
              .get()
              .then((category) {
            List copyList = category.docs[0]["category"];
            copyList.add({
              "category_id": "cat111",
              "category_name": categoryController.text
            });
            category.docs[0].reference.update({"category": copyList}).then(
                (value) => print("successfully updated list"));
          }).onError((error, stackTrace) {
            // if no data found with existing restaurant id ,
            // create new data set
            collection.add({
              "restaurant_id": "123", // change it
              "category": [
                {
                  "category_id": "cat121", // change it
                  "category_name": "cat_name" // change it
                }
              ]
            }).then((value) => print("new data added"));
          });
        }, onCancelPress: () {
          Navigator.pop(context);
        })
      ],
    );
  }
}
