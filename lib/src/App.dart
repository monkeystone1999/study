import 'package:flutter/material.dart';
import 'package:production/src/pages/home.dart';
import 'package:production/src/pages/login.dart';
import 'package:production/src/pages/myPage.dart';
import 'package:production/src/pages/search.dart';
import 'package:production/src/pages/signup.dart';
import 'package:production/src/pages/write.dart';
import '../color_schemes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routes: {
        '/': (context) => Home(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => Signup(),
        // '/recruit': (context) => Recruit(),
        '/search': (context) => search(),
        /**이거는 나중에 지도를 넣자 주위 사람 찾기로**/
        '/mypage': (context) => myPage(),
        '/write': (context) => Write(),
      },
    );
  }
}
