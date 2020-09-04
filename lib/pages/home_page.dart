import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    final UserModel _userModel = _userBox.values.first;
    return Scaffold(
      body: Center(
        child: Text(_userModel.displayName),
      ),
    );
  }
}
