import 'package:bookkikko_business/components/common_components/centered_circular_progress_indicator.dart';
import 'package:bookkikko_business/components/common_components/centered_text.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget categoryBuildMethod(
    context, AsyncSnapshot<QuerySnapshot> snapshot, Function() updateState) {
  var snapshotData;
  if (snapshot.hasError) {
    return CenteredText("Something went wrong");
  }

  if (snapshot.hasData) {
    snapshotData = snapshot.data!.docs[0];
    if (!snapshotData.exists) {
      return CenteredText("Document does not exits");
    }
  }

  if (snapshot.connectionState == ConnectionState.done &&
      snapshotData != null) {
    List categories = (snapshotData.data() as Map)["category"];
    // print("category is " + categories.toString());
    if (categories.isEmpty) return CenteredText("No categories found");
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) => OneOrderBoxSkelton(
        titleText: categories[index]["category_name"],
        trailing: (hasModificationPermissionForMenuScreen())
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  categories.removeWhere((element) =>
                      element["category_name"] ==
                      categories[index]["category_name"]);
                  categoryRef
                      .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                      .get()
                      .then((value) {
                    value.docs[0].reference.update({"category": categories});
                    // setState(() {
                    //   print("updated");
                    // });
                    // print("finsihed");
                    updateState();
                  });
                },
              )
            : null,
      ),
    );
  }

  return CenteredCircularProgressIndicator();
}
