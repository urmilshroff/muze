import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muze/services/firebase_auth_helper.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign In'),
          onPressed: () async {
            await Firebase.initializeApp();
            await FirebaseAuthHelper().signInWithGoogle();
          },
        ),
      ),
    );
  }
}
