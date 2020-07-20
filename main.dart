import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon_app/models/User.dart';
import 'package:salon_app/pages/Wrapper.dart';
import 'package:salon_app/services/auth_service.dart';

void main() {
  runApp(MyApp());

  // MaterialApp(
  //   initialRoute: "/login",
  //   routes: {
  //
  //   },
  // );
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
