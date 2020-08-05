import 'package:flutter/material.dart';

class MainAdmin extends StatefulWidget {
  MainAdmin({Key key}) : super(key: key);

  @override
  _MainAdminState createState() => _MainAdminState();
}

class _MainAdminState extends State<MainAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Panel administratora 0.1", 
            style: TextStyle(
              fontFamily: "Raleway"
            ),
          ),
          backgroundColor: Colors.purple[300],
        ),
    );
  }
}