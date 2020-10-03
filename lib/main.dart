import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/pages/home_page.dart';
import 'package:muze/pages/login_page.dart';
import 'package:muze/utils/app_theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'utils/config.dart';

void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('Theme');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class MyApp extends StatefulWidget {
  final Box<UserModel> userBox;
  MyApp({this.userBox});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    currentTheme.addListener(() {
      setState(() {
        print('changes');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<Box<UserModel>>(
      create: (context) => widget.userBox,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Muze',
        theme: MyAppTheme.light,
        darkTheme: MyAppTheme.dark,
        themeMode: currentTheme.currentTheme(),
        initialRoute: widget.userBox.isEmpty ? '/login' : '/home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return PageTransition(
                child: MyLoginPage(),
                type: PageTransitionType.fade,
              );
              break;
            case '/home':
              return PageTransition(
                child: MyHomePage(),
                type: PageTransitionType.fade,
              );
              break;
            default:
              return null;
          }
        },
      ),
    );
  }
}
