import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:muze/utils/text_styles.dart';
import 'package:muze/widgets/primary_button.dart';
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

    ScreenUtil.init(
      context,
      designSize: Size(
        MyScreenSizes.screenWidth,
        MyScreenSizes.screenHeight,
      ),
      allowFontScaling: true,
    );

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/branding/logo.png',
                  height: 120.0.h,
                  width: 120.0.w,
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Text(
                'Muze'.toUpperCase(),
                style: MyTextStyles.title1,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Text(
                'Jam tunes with your friends!',
                style: MyTextStyles.body1,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              MyPrimaryButton(
                text: 'Sign in'.toUpperCase(),
                onPressed: () async {
                  try {
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
            ],
          ),
        ],
      ),
    );
  }
}
