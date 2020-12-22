import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:muze/models/user_model.dart';
import 'package:muze/pages/home_page.dart';
import 'package:muze/pages/login_page.dart';
import 'package:muze/utils/app_theme.dart';
import 'package:muze/utils/screen_sizes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _userBox = await _hiveSetup();
  runApp(MyApp(userBox: _userBox));
}

Future<Box<UserModel>> _hiveSetup() async {
  var document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  final _userBox = await Hive.openBox<UserModel>('userModel');
  return _userBox;
}

class MyApp extends StatelessWidget {
  final Box<UserModel> userBox;
  MyApp({this.userBox});

  @override
  Widget build(BuildContext context) {
    return Provider<Box<UserModel>>(
      create: (context) => userBox,
      child: ScreenUtilInit(
        designSize: Size(
          MyScreenSizes.screenWidth,
          MyScreenSizes.screenHeight,
        ),
        allowFontScaling: true,
        child: MaterialApp(
          title: 'Muze',
          theme: MyAppTheme.light,
          initialRoute: userBox.isEmpty ? '/login' : '/home',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/login':
                return PageTransition<void>(
                  child: MyLoginPage(),
                  type: PageTransitionType.fade,
                );
                break;
              case '/home':
                return PageTransition<void>(
                  child: MyHomePage(),
                  type: PageTransitionType.fade,
                );
                break;
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
