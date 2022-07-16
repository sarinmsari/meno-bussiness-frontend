import 'package:bookkikko_business/firebase_options.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookkikko_business/authentication/auth_global_credentials.dart'
    as auth_globals;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //print("splash screen initialized");

    //TODO : update with real database
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initialConfig();
    });

    super.initState();
  }

  void initialConfig() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // print("firebase initialized");
    //initializing refernces
    initFirebaseReferences();
    //checking if user is signed in

    if (auth_globals.user == null) {
      print("no user is logged in");
      Navigator.pushReplacementNamed(context, "/signin_screen");
    } else {
      print("user is logged in with uid ${auth_globals.user?.uid}");
      await auth_globals.findUserRoleForAuthenticatedUser();
      print("current user role : " + auth_globals.currentUserRole.toString());

      Navigator.pushReplacementNamed(context, "menu_screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 65),
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/food_image_login_screen.png',
                    color: Colors.white30,
                    height: 150,
                  ),
                ),
              ),
              Text(
                "M E N O FOR BUSINESS",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
