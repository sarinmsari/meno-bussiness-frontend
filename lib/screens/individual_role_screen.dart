import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/common_components/centered_circular_progress_indicator.dart';
import 'package:bookkikko_business/components/common_components/centered_text.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class IndividualRoleScreen extends StatefulWidget {
  IndividualRoleScreen({Key? key, required this.roleName}) : super(key: key);
  String roleName;

  @override
  State<IndividualRoleScreen> createState() => _IndividualRoleScreenState();
}

class _IndividualRoleScreenState extends State<IndividualRoleScreen> {
  void updateScreen() {
    setState(() {
      print("rebuilding screen...");
    });
  }

  final String _imageUrl =
      "https://friendlystock.com/wp-content/uploads/2018/06/3-dabbing-chef-character-vector-cartoon-clipart.jpg";

  @override
  Widget build(BuildContext context) {
    String roleName = widget.roleName.toLowerCase();
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.roleName,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/role_form_screen",
                  arguments: RoleFormScreenArguments(
                      roleName: widget.roleName, callback: updateScreen),
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
          future: restaurantRef
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
              List userList = restaurantDetails["roles"][widget.roleName];
              if (userList.isEmpty) return CenteredText("No users found");
              if (userList != null) {
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) => OneOrderBoxSkelton(
                          leading: Image(image: NetworkImage(_imageUrl)),
                          titleText:
                              "${userList[index]["firstname"]} ${userList[index]["lastname"] ?? ""}",
                          subtitle: Text("Tap to view more"),
                          trailing: IconButton(
                            onPressed: () {
                              // update userList and remove the desired user

                              userList.removeWhere((element) =>
                                  (element["firstname"] ==
                                      userList[index]["firstname"]) &&
                                  (element["lastname"] ==
                                      userList[index]["lastname"]));

                              // print(userList);
                              restaurantRef
                                  .where("restaurant_id",
                                      isEqualTo: RESTAURANT_ID)
                                  .get()
                                  .then(
                                (value) {
                                  Map _roleMap =
                                      (value.docs[0].data() as Map)["roles"];
                                  // print(_roleMap);

                                  _roleMap[widget.roleName] = userList;
                                  value.docs[0].reference
                                      .update({"roles": _roleMap});
                                  setState(() {
                                    // print("updated screen");
                                  });
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.black,
                            ),
                          ),
                        ));
                // List<Widget> resultList = <Widget>[];
                // userList.forEach((user) {
                //   resultList.add(OneOrderBoxSkelton(
                //     leading: Image(image: NetworkImage(_imageUrl)),
                //     titleText: "${user["firstname"]} ${user["lastname"] ?? ""}",
                //     subtitle: Text("Tap to view more"),
                //     trailing: IconButton(
                //       onPressed: () {
                //         // update userList and remove the desired user
                //       },
                //       icon: Icon(
                //         Icons.delete_outline,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ));
                // });
                // return ListView(children: resultList);
              } else {
                return CenteredText("No users found for ${widget.roleName}");
              }
            }

            return CenteredCircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
