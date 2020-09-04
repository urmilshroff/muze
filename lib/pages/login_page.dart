import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';
import 'package:provider/provider.dart';

class MyLoginPage extends StatelessWidget {
  void _saveUserToHive(User _firebaseUser, Box<UserModel> _userBox) {
    final UserModel userModel = UserModel(
      uid: _firebaseUser.uid,
      displayName: _firebaseUser.displayName,
      photoUrl: _firebaseUser.photoURL,
      emailId: _firebaseUser.email,
    );

    print('Saving user ${userModel.displayName}');
    _userBox.add(userModel);
  }

  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign In'),
          onPressed: () async {
            try {
              await Firebase.initializeApp();
              User _firebaseUser =
                  await FirebaseAuthHelper().signInWithGoogle();

              _saveUserToHive(_firebaseUser, _userBox);

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (Route<dynamic> route) => false,
              );
            } catch (error) {
              print('Error: $error');
            }
          },
        ),
      ),
    );
  }
}
