import 'package:flutter/material.dart';

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
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 16.0,
          fontFamily: 'LexendDeca',
        ),
      ),
      color: Theme.of(context).errorColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: onPressed,
    );
  }
}
