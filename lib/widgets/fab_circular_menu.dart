import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/screen_sizes.dart';

class MyFABCircularMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      height: ScreenSizes.screenHeight,
      width: ScreenSizes.screenWidth,
      allowFontScaling: true,
    );
    return FabCircularMenu(
      fabColor: MyColors.primary,
      fabOpenColor: MyColors.secondary,
      fabOpenIcon: Icon(Icons.menu_rounded, color: MyColors.white),
      fabCloseIcon: Icon(Icons.close_rounded, color: MyColors.white),
      ringColor: MyColors.tertiary,
      ringDiameter: 380.0.w,
      ringWidth: 80.0.w,
      fabElevation: 3.0,
      children: [
        Container(),
        Container(),
      ],
    );
  }
}
