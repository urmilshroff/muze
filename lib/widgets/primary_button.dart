import 'package:flutter/material.dart';
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
      child: Text(
        text,
        style: MyTextStyles.button,
      ),
      color: MyColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: onPressed,
    );
  }
}
