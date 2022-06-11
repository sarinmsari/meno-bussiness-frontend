import 'package:bookkikko_business/argument_objects/arguments.dart';
import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/drawer_components.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/screens/individual_role_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  RoleScreen({Key? key, required this.roleName}) : super(key: key);
  String _userUrl =
      "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png";
  final String roleName;
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
            titleText: roleName,
            subtitle: Text("Tap to view more"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            listTileOnTap: () {
              Navigator.pushNamed(
                context,
                '/individual_role_screen',
                arguments: IndividualRoleScreenArguments(
                  roleName: roleName,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
