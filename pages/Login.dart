import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:salon_app/pages/Register.dart';
import 'package:salon_app/services/auth_service.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:salon_app/words/models.dart';





class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  String dataCompany;
  String passwordCompany;
  String emailCompany;
  String logButtonText;
  String textRegister;
  String errorPassword;
  String errorEmail;


  Future<String> loadWordFromAssets() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }

  Future loadWord() async {
    String jsonString = await loadWordFromAssets();
    final jsonResponse = jsonDecode(jsonString);
    Words words = Words.fromJson(jsonResponse);
    setState(() {
      dataCompany = words.nameCompany;
      passwordCompany = words.password;
      emailCompany = words.email;
      logButtonText = words.logButtonText;
      textRegister = words.textRegister;
      errorEmail = words.errorEmail;
      errorPassword = words.errorPassword;
    });
    
  }

  @override
  void initState() { 
    super.initState();
    loadWord();
  }


  String email;
  String password;
  String errorResult;

  AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataCompany.toString(),
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        ),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 210.0, 30.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? errorEmail.toString() : null,
                onChanged: (value) {
                  email = value;
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  focusColor: Colors.purple[300],
                  labelText: emailCompany.toString(),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                    fontFamily: "Raleway",
                    color: Colors.grey[500],
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) =>
                    value.length < 6 ? errorPassword.toString() : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  labelText: passwordCompany.toString(),
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[500],
                    fontFamily: "Raleway",
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = _authService.logIn(email, password);
                    if (result == null) {
                      setState(() => errorResult = 'Wystąpił błąd');
                    } else {
                      print("Zalogowałeś się pomyślnie");
                    }
                  }
                },
                child: Text(
                  logButtonText.toString(),
                  style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                ),
                color: Colors.purple[300],
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  textRegister.toString(),
                  style:
                      TextStyle(color: Colors.grey[600], fontFamily: "Raleway"),
                ),
                color: Colors.white12,
                elevation: 0.0,
              ),
              // Text(
              //   errorResult.toString(),
              //   style: TextStyle(fontSize: 14.0, color: Colors.red),
              // ),
              SizedBox(
                height: 130.0,
              ),
              Text(
                "powered by wisewayapps.com",
                style:
                    TextStyle(color: Colors.grey[400], fontFamily: "Raleway"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
