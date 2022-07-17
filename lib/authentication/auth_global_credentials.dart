library auth.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? user;
String? currentUserRole;

Future<void> findUserRoleForAuthenticatedUser() async {
  if (user?.uid != null) {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("permission")
        .where("user_id", isEqualTo: user?.uid)
        .limit(1)
        .get();

    // print("finished");

    currentUserRole = data.docs[0].data()["role"];
  }
}

fetchUserFromFirebase() {
  FirebaseAuth _auth = FirebaseAuth.instance;
  user = _auth.currentUser;

  //print(auth_globals.user?.email);
}
