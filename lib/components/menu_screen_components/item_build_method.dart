import 'package:bookkikko_business/components/common_components/centered_circular_progress_indicator.dart';
import 'package:bookkikko_business/components/common_components/centered_text.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget itemBuildMethod(
    context, AsyncSnapshot<QuerySnapshot> snapshot, Function() updateState) {
  if (snapshot.hasError) {
    return Text("Something went wrong");
  }

  if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
    return Text("Document does not exist");
  }

  if (snapshot.connectionState == ConnectionState.done) {
    var snapshotData = snapshot.data!.docs[0].data();
    Map<String, dynamic> data = snapshotData as Map<String, dynamic>;
    List items = data["items"];
    if (items.length == 0) return CenteredText("No Items found");
    return ListView.builder(
      itemCount: data["items"].length,
      itemBuilder: (ctx, index) => OneOrderBoxSkelton(
        leading: Image(
          width: 50,
          height: 50,
          image: NetworkImage(imageAddress),
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
        trailing: (hasModificationPermissionForMenuScreen())
            ? IconButton(
                onPressed: () {
                  items.removeWhere((element) =>
                      element["item_category"] ==
                      items[index]["item_category"]);

                  // item removed , update db
                  menuRef
                      .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                      .get()
                      .then((value) {
                    value.docs[0].reference.update({"items": items});
                    updateState();
                    // setState(() {
                    //   print("finsihed updation");
                    // });
                  });
                },
                icon: Icon(Icons.delete),
              )
            : null,
      ),
    );
  }

  return CenteredCircularProgressIndicator();
}
