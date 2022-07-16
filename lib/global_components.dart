import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookkikko_business/authentication/auth_global_credentials.dart'
    as auth_globals;

const RESTAURANT_ID = "112233";
const APP_NAME = 'M E N O';
const APP_TAG_LINE = 'The Pocket Menu';

// const RESTAURANT_ID = "112234";

// firebase references ;
late CollectionReference categoryRef;
late CollectionReference menuRef;
late CollectionReference restaurantRef;
void initFirebaseReferences() {
  categoryRef = FirebaseFirestore.instance.collection("categories");
  menuRef = FirebaseFirestore.instance.collection("menu");
  restaurantRef = FirebaseFirestore.instance.collection("restaurant");
}

// firebase data
Future<QuerySnapshot<Map<String, dynamic>>>? restaurantData;
Future<QuerySnapshot<Map<String, dynamic>>>? categoryData;
Future<QuerySnapshot<Map<String, dynamic>>>? menuData;

class CustomDevider extends StatelessWidget {
  CustomDevider({
    Key? key,
  }) : super(key: key);

  final Color _fontColor = Colors.white;
  final Color _fontColor2 = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, 0), // near the top right
          radius: 100,
          colors: <Color>[
            _fontColor, // yellow sun
            _fontColor2
          ],
          stops: <double>[.01, 1],
        ),
      ),
      width: double.infinity,
      height: 1,
    );
  }
}

bool userInAnyOf(List<String> items, String? element) {
  if (element != null)
    return items.contains(element.toLowerCase());
  else
    return false;
}

bool hasModificationPermissionForMenuScreen() {
  return userInAnyOf(["manager", "waiter"], auth_globals.currentUserRole);
}
