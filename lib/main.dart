import 'package:flutter/material.dart';
import 'package:imovaluer/pagers/main.dart';
import 'package:imovaluer/splashscreen.dart';
//import 'package:imovaluer/ValuationList/list.dart';
//import 'package:imovaluer/popup/popup.dart';
import 'package:imovaluer/login/loginpage.dart';
import 'package:imovaluer/login/signuppage.dart';
//import 'package:imovaluer/homepage.dart';
//import 'package:imovaluer/calendar/calendar_main.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.red),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new LoginPage(),
        '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new EntryPoint(),
      },
    );
  }
}




