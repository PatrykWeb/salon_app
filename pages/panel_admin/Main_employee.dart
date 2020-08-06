import 'package:flutter/material.dart';

class MainEmployee extends StatefulWidget {
  MainEmployee({Key key}) : super(key: key);

  @override
  _MainEmployeeState createState() => _MainEmployeeState();
}

class _MainEmployeeState extends State<MainEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Sekcja pracownika")
       ),
    );
  }
}