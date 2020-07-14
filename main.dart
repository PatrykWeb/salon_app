import 'package:flutter/material.dart';
import 'package:salon_app/pages/Login.dart';
import 'package:salon_app/pages/Register.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login": (context) => Login(),
      "/register": (context) => Register()
    },
  ));
}
