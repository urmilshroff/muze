import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:muze/utils/text_styles.dart';
import 'package:muze/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    final UserModel _userModel = _userBox.values.first;

    ScreenUtil.init(
      context,
      designSize: Size(
        MyScreenSizes.screenWidth,
        MyScreenSizes.screenHeight,
      ),
      allowFontScaling: true,
    );

    Future<void> _showInfoPopup() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 240.0.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/branding/logo.png',
                            height: 32.0.h,
                            width: 32.0.w,
                          ),
                          Text(
                            'Muze',
                            style: MyTextStyles.title3,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Container(
                        width: 200.0.w,
                        child: AutoSizeText(
                          'A fully open source project made with ❤ by Urmil Shroff',
                          style: MyTextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      MyPrimaryButton(
                        text: 'Sign out'.toUpperCase(),
                        onPressed: () async {
                          try {
                            await Firebase.initializeApp();
                            await FirebaseAuthHelper()
                                .signOutWithGoogle(); // deletes from Firebase

                            _userBox.deleteAt(0); // deletes from Hive

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                              (Route<dynamic> route) => false,
                            );
                          } catch (error) {
                            print('Error: $error');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: MyColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3.0,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/branding/logo.png',
                height: 46.0.h,
                width: 46.0.w,
              ),
            ),
            Text(
              'Muze'.toUpperCase(),
              style: MyTextStyles.title2,
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 18.0.w,
                backgroundImage:
                    CachedNetworkImageProvider(_userModel.photoUrl),
              ),
              onTap: () async => _showInfoPopup(),
            ),
          ],
        ),
      ),
      body: Container(),
      floatingActionButton: FabCircularMenu(
        fabColor: MyColors.primary,
        fabOpenColor: MyColors.secondary,
        fabOpenIcon: Icon(Icons.menu_rounded, color: MyColors.white),
        fabCloseIcon: Icon(Icons.close_rounded, color: MyColors.white),
        ringColor: MyColors.primary,
        ringDiameter: 360.0.w,
        ringWidth: 60.0.w,
        fabSize: 56.0,
        fabElevation: 3.0,
        children: [
          IconButton(
            icon: Icon(Icons.person_add_rounded, color: MyColors.white),
            iconSize: 30.0.w,
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.pause_rounded, color: MyColors.white),
            iconSize: 36.0.w,
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.play_arrow_rounded, color: MyColors.white),
            iconSize: 36.0.w,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
