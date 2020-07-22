import 'package:flutter/material.dart';
import 'package:salon_app/services/auth_service.dart';
import 'package:firebase_database/firebase_database.dart';

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
        backgroundColor: Colors.purple[300],
        title: Text(
          "Strona główna",
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await authService.logOut();
            },
            label: Text(
              "Wyloguj",
              style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
            ),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.airline_seat_recline_normal),
              title: Text("Test"),
              subtitle: Text("Testowy opis"),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Zarejestruj"),
                  onPressed: () {
                    
                  },
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}




