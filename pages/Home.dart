import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_app/words/models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String notificationLogout;
  String appNameHome;

  Future<String> getWordFromAssets() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }

  Future getWord() async {
    String getAssetsString = await getWordFromAssets();
    final parseAssets = jsonDecode(getAssetsString);
    Words words = Words.fromJson(parseAssets);
    setState(() {
      notificationLogout = words.notificationLogout;
      appNameHome = words.appNameHome;
    });
  }

  @override
  void initState() { 
    super.initState();
    getWord();
  }

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(
          appNameHome.toString(),
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await authService.logOut();
              Fluttertoast.showToast(
                  msg: notificationLogout.toString(),
                  backgroundColor: Colors.purple[300],
                  toastLength: Toast.LENGTH_SHORT);
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
                    onPressed: () {},
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
