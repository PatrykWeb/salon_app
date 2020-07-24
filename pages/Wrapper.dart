import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salon_app/pages/Login.dart';
import 'package:salon_app/models/User.dart';
import 'package:salon_app/pages/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_app/words/models.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String notificationLogin;


  Future<String> getJsonAssets() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }
  Future getWordJson() async {
    String getAssets = await getJsonAssets();
    final getJson = jsonDecode(getAssets);
    Words words = Words.fromJson(getJson);
    setState(() {
      notificationLogin = words.notificationLogin;
    });

  }

  @override
  void initState() { 
    super.initState();
    getWordJson();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Login();
    } else {
      Fluttertoast.showToast(
          msg: notificationLogin.toString(),
          backgroundColor: Colors.purple[300],
          toastLength: Toast.LENGTH_SHORT);
      return Home();
    }
  }
}
