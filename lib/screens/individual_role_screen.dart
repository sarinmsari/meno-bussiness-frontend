import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class IndividualRoleScreen extends StatelessWidget {
  IndividualRoleScreen({Key? key, required this.roleName}) : super(key: key);
  final String _imageUrl =
      "https://friendlystock.com/wp-content/uploads/2018/06/3-dabbing-chef-character-vector-cartoon-clipart.jpg";
  String roleName;
  @override
  Widget build(BuildContext context) {
    roleName = roleName.toLowerCase();
    return Scaffold(
      appBar: CustomAppBar(
        title: roleName,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/role_form_screen",
                  arguments: RoleFormScreenArguments(roleName: roleName),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("restaurant")
              .where("restaurant_id", isEqualTo: RESTAURANT_ID)
              .limit(1)
              .get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              var restaurantDetails = snapshot.data!.docs[0];
              var userList = restaurantDetails["roles"][roleName];
              if (userList != null) {
                List<Widget> resultList = <Widget>[];
                userList.forEach((user) {
                  resultList.add(OneOrderBoxSkelton(
                    leading: Image(image: NetworkImage(_imageUrl)),
                    titleText: "${user["firstname"]} ${user["lastname"] ?? ""}",
                    subtitle: Text("Tap to view more"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                    ),
                  ));
                });
                return ListView(children: resultList);
              } else {
                return Align(child: Text("No users found for ${roleName}"));
              }
            }

            return Align(
              child: CircularProgressIndicator(),
            );
            //rest
            // return ListView(
            //   children: [
            //     OneOrderBoxSkelton(
            //       leading: Image(image: NetworkImage(_imageUrl)),
            //       titleText: "Pablo Piccaso",
            //       subtitle: Text("Tap to view more"),
            //       trailing: IconButton(
            //         onPressed: () {},
            //         icon: Icon(
            //           Icons.delete_outline,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     OneOrderBoxSkelton(
            //       leading: Image(image: NetworkImage(_imageUrl)),
            //       titleText: "Leonardo Da Vinci",
            //       subtitle: Text("Tap to view more"),
            //       trailing: IconButton(
            //         onPressed: () {},
            //         icon: Icon(
            //           Icons.delete_outline,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
