import 'package:bookkikko_business/firebase_options.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      initializeFirebase();
    });

    super.initState();
  }

  void initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("firebase initialized");
    //initializing refernces
    initFirebaseReferences();
    Future.delayed(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, '/menu_screen'));
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
