import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  MyFloatingActionButton({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: icon,
      foregroundColor: MyColors.darkPrimary,
      backgroundColor: MyColors.lightPrimary,
      splashColor: MyColors.tertiary,
      elevation: 3.0,
      onPressed: onPressed,
    );
  }
}
