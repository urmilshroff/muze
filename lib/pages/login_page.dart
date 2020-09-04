import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';

class MyLoginPage extends StatelessWidget {
  Future<void> _saveUserToHive(User _firebaseUser) async {
    final Box<UserModel> _userBox = await Hive.openBox<UserModel>('user');

    final UserModel userModel = UserModel(
      uid: _firebaseUser.uid,
      displayName: _firebaseUser.displayName,
      photoUrl: _firebaseUser.photoURL,
      emailId: _firebaseUser.email,
    );

    print('Saving ${userModel.displayName}...');
    _userBox.add(userModel);
  }

  @override
  Widget build(BuildContext context) {
    User _firebaseUser;
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
            await _saveUserToHive(_firebaseUser);
          },
        ),
      ),
    );
  }
}
