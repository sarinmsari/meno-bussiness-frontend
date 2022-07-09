import 'package:bookkikko_business/authentication/autentication_services.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';
import '../authentication/auth_global_credentials.dart' as auth_globals;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _userName = auth_globals.user?.displayName;
    final _userEmail = auth_globals.user?.email;
    return Scaffold(
      drawer: DrawyerPage(),
      appBar: CustomAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Name :'),
                  Text(_userName ?? 'Unknown User'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Email :'),
                  Text(_userEmail ?? 'Unknown User'),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  signOut().then((value) => {
                        Navigator.pushReplacementNamed(
                            context, '/signin_screen'),
                      });
                },
                child: const Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
