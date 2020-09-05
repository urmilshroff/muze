import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:muze/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    final UserModel _userModel = _userBox.values.first;

    ScreenUtil.init(
      context,
      height: ScreenSizes.screenHeight,
      width: ScreenSizes.screenWidth,
      allowFontScaling: true,
    );

    return Scaffold(
      backgroundColor: MyColors.white,
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
              style: MyTextStyles.heading,
            ),
            CircleAvatar(
              radius: 18.0.w,
              backgroundImage: CachedNetworkImageProvider(_userModel.photoUrl),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: MyColors.white,
        elevation: 0.0,
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
