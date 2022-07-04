import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/drawer_components.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  RoleScreen({Key? key}) : super(key: key);
  String _userUrl =
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
                return Align(
                    child:
                        Text("snapshot fetching from role screen has error"));
              }
              if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
                // throw Exception("snapshot has no data");
                return Align(child: Text("snapshot has no data"));
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

              return Align(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

// for adding dummy database 

// void addRestaurant() {
//   var db = FirebaseFirestore.instance.collection("restaurant");
//   db.add(
//     {
//       "restaurant_id": "restaurantid002",
//       "restaurant_name": "Ithatha's Kitchen",
//       "restaurant_logo": "",
//       "restaurant_location": "",
//       "restaurant_rating": "4.5",
//       "restaurant_open_time": "7:30am",
//       "restaurant_closing_time": "9:30pm",
//       "restaurant_category": "multi cuisine",
//       "membership": "standard",
//       "categories": [
//         "category001",
//         "category002",
//         "category003",
//         "category004",
//         "category005",
//         "category006",
//         "category007",
//         "category008"
//       ],
//       "roles": {
//         "manager": [
//           {
//             "user_id": "user111",
//             "firstname": "Linus",
//             "gender": "male",
//             "phonenumber1": 1122445566
//           }
//         ],
//         "chef": [
//           {
//             "user_id": "user211",
//             "firstname": "Tynan",
//             "gender": "male",
//             "phonenumber1": 2122445566
//           },
//           {
//             "user_id": "user212",
//             "firstname": "Katherine",
//             "gender": "female",
//             "phonenumber1": 5128449526
//           }
//         ],
//         "waiter": [
//           {
//             "user_id": "user311",
//             "firstname": "Mariana",
//             "gender": "female",
//             "phonenumber1": 58965874
//           }
//         ],
//       },
//     },
//   );
// }
