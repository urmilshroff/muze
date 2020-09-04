import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/pages/home_page.dart';
import 'package:muze/pages/login_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Box<UserModel> _userBox = await _hiveSetup();
  runApp(MyApp(userBox: _userBox));
}

Future<Box<UserModel>> _hiveSetup() async {
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  final Box<UserModel> _userBox = await Hive.openBox<UserModel>('userModel');
  return _userBox;
}

class MyApp extends StatelessWidget {
  final Box<UserModel> userBox;
  MyApp({this.userBox});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Box<UserModel>>(create: (context) => userBox),
      ],
      child: MaterialApp(
        title: 'Muze',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: userBox.isEmpty ? '/login' : '/home',
        routes: {
          '/login': (context) => MyLoginPage(),
          '/home': (context) => MyHomePage(),
        },
      ),
    );
  }
}
