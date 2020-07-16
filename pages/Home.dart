import 'package:flutter/material.dart';
import 'package:salon_app/services/auth_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strona główna"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await authService.logOut();
            },
            label: Text(
              "Wyloguj", 
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.exit_to_app, 
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}