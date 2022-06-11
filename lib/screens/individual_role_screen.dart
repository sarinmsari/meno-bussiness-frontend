import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class IndividualRoleScreen extends StatelessWidget {
  IndividualRoleScreen({Key? key, required this.roleName}) : super(key: key);
  final String _imageUrl =
      "https://friendlystock.com/wp-content/uploads/2018/06/3-dabbing-chef-character-vector-cartoon-clipart.jpg";
  final String roleName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: roleName,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      drawer: DrawyerPage(),
      body: SafeArea(
          child: ListView(
        children: [
          OneOrderBoxSkelton(
            leading: Image(image: NetworkImage(_imageUrl)),
            titleText: "Pablo Piccaso",
            subtitle: Text("Tap to view more"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: Colors.black,
              ),
            ),
          ),
          OneOrderBoxSkelton(
            leading: Image(image: NetworkImage(_imageUrl)),
            titleText: "Leonardo Da Vinci",
            subtitle: Text("Tap to view more"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: Colors.black,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
