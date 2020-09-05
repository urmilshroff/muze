import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:muze/utils/text_styles.dart';
import 'package:muze/widgets/floating_action_button.dart';
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
      floatingActionButton: MyFloatingActionButton(
        icon: Icon(Icons.add_rounded),
        onPressed: () => print('FAB clicked'),
      ),
    );
  }
}
