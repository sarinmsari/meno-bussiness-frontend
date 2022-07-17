import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/common_components/centered_circular_progress_indicator.dart';
import 'package:bookkikko_business/components/common_components/centered_text.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';

import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  RoleScreen({Key? key}) : super(key: key);
  final String _userUrl =
      "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png";
  String roleName = "Manager";

  @override
  Widget build(BuildContext context) {
    var roles = FirebaseFirestore.instance.collection("roles");
    return Scaffold(
      appBar: CustomAppBar(title: "Roles"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: FutureBuilder(
            future: roles
                .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                .limit(1)
                .get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                // throw Exception("snapshot fetching from role screen has error");
                return CenteredText(
                    "snapshot fetching from role screen has error");
              }
              if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
                // throw Exception("snapshot has no data");
                return CenteredText("snapshot has no data");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                var snapshotData = snapshot.data;
                List<Widget> allRoles = <Widget>[];
                if (snapshotData != null) {
                  var restaurantRoles = snapshotData.docs[0];
                  if (restaurantRoles["roles"] != null) {
                    (restaurantRoles["roles"] as List)
                        .forEach((roleName) => allRoles.add(
                              OneOrderBoxSkelton(
                                leading: Image(
                                  image: NetworkImage(_userUrl),
                                ),
                                titleText: roleName.toString().toUpperCase(),
                                subtitle: Text("Tap to view more"),
                                trailing: Icon(Icons.arrow_forward_ios_rounded),
                                listTileOnTap: () {
                                  // fetchRestaurantRoles();

                                  Navigator.pushNamed(
                                    context,
                                    '/individual_role_screen',
                                    arguments: IndividualRoleScreenArguments(
                                      roleName: roleName,
                                    ),
                                  );
                                },
                              ),
                            ));

                    return ListView(children: allRoles);
                  }
                } else {
                  throw Exception("snapshotData is null");
                }
              }

              return CenteredCircularProgressIndicator();
            }),
      ),
    );
  }
}
