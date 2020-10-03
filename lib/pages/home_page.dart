import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/services/firebase_auth_helper.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:muze/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:muze/utils/config.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  color: Theme.of(context).primaryColor,
                  //fixed LayoutBuilder does not support returning intrinsic dimensions error on smaller devices.
                  width: MediaQuery.of(context).size.width - 140,
                  height: MediaQuery.of(context).size.height - 550,
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
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24.0,
                              fontFamily: 'LexendDeca',
                            ),
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
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Nunito',
                              color: Theme.of(context).accentColor),
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
            backgroundColor: Theme.of(context).primaryColor,
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
        fabColor: MyColors.maze,
        fabOpenColor: MyColors.badgeColor,
        fabOpenIcon:
            Icon(Icons.menu_rounded, color: Theme.of(context).primaryColor),
        fabCloseIcon:
            Icon(Icons.close_rounded, color: Theme.of(context).primaryColor),
        ringColor: MyColors.maze,
        ringDiameter: 360.0.w,
        ringWidth: 60.0.w,
        fabSize: 56.0,
        fabElevation: 3.0,
        children: [
          IconButton(
            icon: Icon(Icons.brightness_medium_rounded,
                color: Theme.of(context).primaryColor),
            iconSize: 30.0.w,
            highlightColor: Theme.of(context).splashColor,
            splashColor: Theme.of(context).splashColor,
            onPressed: () {
              currentTheme.switchTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add_rounded,
                color: Theme.of(context).primaryColor),
            iconSize: 30.0.w,
            highlightColor: Theme.of(context).splashColor,
            splashColor: Theme.of(context).splashColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.pause_outlined,
                color: Theme.of(context).primaryColor),
            iconSize: 36.0.w,
            highlightColor: Theme.of(context).splashColor,
            splashColor: Theme.of(context).splashColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.play_arrow_rounded,
                color: Theme.of(context).primaryColor),
            iconSize: 36.0.w,
            highlightColor: Theme.of(context).splashColor,
            splashColor: Theme.of(context).splashColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
