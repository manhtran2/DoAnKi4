import 'package:doanki4/Search_screen/Seach.dart';
import 'package:doanki4/bookcase_screen/FilterBookcase.dart';
import 'package:doanki4/chapter_screen/chapter.dart';
import 'package:doanki4/chapter_screen/chapter_pages.dart';
import 'package:doanki4/pages/Profile.dart';
import 'package:doanki4/bookcase_screen/bookcase.dart';
import 'package:doanki4/Homescreen/home.dart';
import 'package:doanki4/request/login.dart';
import 'package:flutter/material.dart';

import 'Homescreen/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => Login(),
      //   '/homescreen': (context) => HomePage()
      // },
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/homescreen':
      //       return MaterialPageRoute(builder: (context) => HomePage());
      //     default:
      //       return null;
      //   }
      // },
      title: 'Flutter Demo',

      home:BottomNavigationBarController(),
    );
  }
}