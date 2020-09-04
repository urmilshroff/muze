import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/pages/login_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  final Box<UserModel> _userBox = await Hive.openBox<UserModel>('user');

  runApp(MyApp(
    initialRoute: _userBox.isEmpty ? '/login' : '/home',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute});

  @override
  Widget build(BuildContext context) {
    print('initialRoute: $initialRoute');
    return MaterialApp(
      title: 'Muze',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => MyLoginPage(),
        '/home': (context) => MyLoginPage(),
      },
    );
  }
}
