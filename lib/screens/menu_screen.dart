import 'package:bookkikko_business/authentication/auth_global_credentials.dart';
import 'package:bookkikko_business/authentication/auth_global_credentials.dart'
    as auth_globals;
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/common_components/tab_bar_text.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/menu_screen_components/alert_box_components.dart';
import 'package:bookkikko_business/components/menu_screen_components/menu_alert_dialog_components.dart';
import 'package:bookkikko_business/components/orders_page/filter_section.dart';
import 'package:bookkikko_business/components/orders_page/one_order_box.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final String _imageAddress =
      "https://www.indianhealthyrecipes.com/wp-content/uploads/2019/02/hyderabadi-biryani-recipe-500x500.jpg";

  var _tabController;

  var tabIndex;
  void updateScreen() {
    setState(() {
      // rebuilding the widget
      print("rebuilding...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Menu",
        actions: [
          if (hasModificationPermissionForMenuScreen()) ...[
            IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return MenuItemAlertDialog(
                                          callback: updateScreen,
                                        );
                                      });
                                },
                                child: Text("Add Item"))),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (_) => MenuCategoryAlertDialog(
                                          callback: updateScreen,
                                        ));
                              },
                              child: Text("Add Category")),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                        )
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            )
          ]
        ],
      ),
      drawer: DrawyerPage(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              // height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                  border: Border.all(width: 1, color: Colors.grey.shade900)),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade900),
                  color: Colors.white,
                ),
                tabs: [
                  Tab(child: TabBarText("Items")),
                  Tab(child: TabBarText("Category"))
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder(
                      future: menuRef
                          .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                          .limit(1)
                          .get(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData &&
                            !snapshot.data!.docs[0].exists) {
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          var snapshotData = snapshot.data!.docs[0].data();
                          Map<String, dynamic> data =
                              snapshotData as Map<String, dynamic>;
                          var items = data["items"];
                          return ListView.builder(
                            itemCount: data["items"].length,
                            itemBuilder: (ctx, index) => OneOrderBoxSkelton(
                              leading: Image(
                                width: 50,
                                height: 50,
                                image: NetworkImage(_imageAddress),
                              ),
                              titleText: items[index]["item_name"],
                              subtitle: Row(
                                children: [
                                  Text("Price : ${items[index]['item_price']}"),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "Category : ${items[index]['item_category']}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                              trailing:
                                  (hasModificationPermissionForMenuScreen())
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit),
                                        )
                                      : null,
                            ),
                          );
                        }

                        return Align(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  FutureBuilder(
                      future: categoryRef
                          .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                          .limit(1)
                          .get(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        var snapshotData;
                        if (snapshot.hasError) {
                          return Align(child: Text("Something went wrong"));
                        }

                        if (snapshot.hasData) {
                          snapshotData = snapshot.data!.docs[0];
                          if (!snapshotData.exists) {
                            return Align(
                                child: Text("Document does not exits"));
                          }
                        }

                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshotData != null) {
                          List categories =
                              (snapshotData.data() as Map)["category"];
                          return ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (ctx, index) => OneOrderBoxSkelton(
                              titleText: categories[index]["category_name"],
                              trailing:
                                  (hasModificationPermissionForMenuScreen())
                                      ? IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            print("icon button pressed");
                                          },
                                        )
                                      : null,
                            ),
                          );
                        }

                        return Align(
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
