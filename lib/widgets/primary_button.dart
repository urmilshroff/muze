import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/text_styles.dart';

class MyPrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  MyPrimaryButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 60.0.h,
      minWidth: 120.0.w,
      child: Text(
        text,
        style: MyTextStyles.button,
      ),
      color: MyColors.light,
      splashColor: MyColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: onPressed,
    );
  }
}
