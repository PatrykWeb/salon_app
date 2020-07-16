import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon_app/models/User.dart';
import 'package:salon_app/pages/Home.dart';
import 'package:salon_app/pages/Login.dart';
import 'package:salon_app/pages/Register.dart';
import 'package:salon_app/pages/Wrapper.dart';
import 'package:salon_app/services/auth_service.dart';

void main() {
  runApp(MyApp(
      // initialRoute: "/login",
      // routes: {
      //   "/login": (context) => Login(),
      //   "/register": (context) => Register(),
      //   "/home": (context) => Home(),
      // },
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
