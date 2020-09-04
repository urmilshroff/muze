import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';

class MyLoginPage extends StatelessWidget {
  void _saveUserToHive(User _firebaseUser, Box<UserModel> _userBox) {
    final UserModel _userModel = UserModel(
      uid: _firebaseUser.uid,
      displayName: _firebaseUser.displayName,
      photoUrl: _firebaseUser.photoURL,
      emailId: _firebaseUser.email,
    );

    _userBox.add(_userModel);
  }

  @override
  Widget build(BuildContext context) {
    User _firebaseUser;
    Box<UserModel> _userBox;

    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign In'),
          onPressed: () async {
            try {
              await Firebase.initializeApp();
              _firebaseUser = await FirebaseAuthHelper().signInWithGoogle();
              print('${_firebaseUser.displayName} signed in');
            } catch (error) {
              print('Error: $error');
            }
            _firebaseUser ?? _saveUserToHive(_firebaseUser, _userBox);
          },
        ),
      ),
    );
  }
}
