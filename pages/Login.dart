import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:salon_app/pages/Register.dart';
import 'package:salon_app/services/auth_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          "Salon Kobiet Sukcesu",
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
                    value.isEmpty ? "Podaj adres email" : null,
                onChanged: (value) {
                  email = value;
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  focusColor: Colors.purple[300],
                  labelText: "Email",
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
                    value.length < 6 ? "Hasło musi mieć 6 znaków" : null,
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
                  labelText: "Password",
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
                  "Zaloguj",
                  style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                ),
                color: Colors.purple[300],
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Register()
                  ));
                },
                child: Text(
                  "Nie masz konta? Zarejestruj sie.",
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
