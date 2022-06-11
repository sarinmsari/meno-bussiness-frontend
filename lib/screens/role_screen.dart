import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/drawer_components.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RolePage extends StatelessWidget {
  RolePage({Key? key}) : super(key: key);
  String _userUrl =
      "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Roles"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => OneOrderBoxSkelton(
            leading: Image(
              image: NetworkImage(_userUrl),
            ),
            titleText: "Cheff Role",
            subtitle: Text("Tap to view more"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            listTileOnTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndividualRolePage()));
            },
          ),
        ),
      ),
    );
  }
}
