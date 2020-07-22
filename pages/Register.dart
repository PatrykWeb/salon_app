import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:salon_app/services/auth_service.dart';
import 'package:salon_app/words/models.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String appBarRegister;
  String emailRegister;
  String passwordRegister;
  String nameSurname;
  String numberPhone;
  String errorEmail;
  String errorPassword;
  String errorNameSurname;
  String errorNumberPhone;
  String buttonRegister;

  Future<String> getWordAssets() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }

  Future getWord() async {
    String getAssetsJson = await getWordAssets();
    var getJson = jsonDecode(getAssetsJson);
    Words words = Words.fromJson(getJson);
    setState(() {
      appBarRegister = words.appBarRegister;
      emailRegister = words.emailRegister;
      passwordRegister = words.passwordRegister;
      nameSurname = words.nameSurname;
      numberPhone = words.numberPhone;
      errorEmail = words.errorEmail;
      errorPassword = words.errorPassword;
      errorNameSurname = words.errorNameSurname;
      errorNumberPhone = words.errorNumberPhone;
      buttonRegister = words.buttonRegister;

    });
  }

  @override
  void initState() { 
    super.initState();
    getWord();
  }

  String _email;
  String _password;
  String _nameSurname;
  int _number;
  String error;

  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarRegister.toString(),
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) => value.isEmpty ? errorEmail.toString() : null,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  labelText: emailRegister.toString(),
                  labelStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18.0,
                      fontFamily: 'Raleway'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => value.length < 6 ? errorPassword.toString() : null,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: passwordRegister.toString(),
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.0,
                      color: Colors.grey[500]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => value.isEmpty ? errorNameSurname.toString() : null,
                onChanged: (value) {
                  setState(() {
                    _nameSurname = value;
                  });
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: nameSurname.toString(),
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.0,
                      color: Colors.grey[500]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (value) => value.length <= 9 ? errorNumberPhone.toString() : null,
                onChanged: (value) {
                  setState(() {
                    _number = int.parse(value);
                  });
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: numberPhone.toString(),
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.0,
                      color: Colors.grey[500]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.purple[300],
                child: Text(
                  buttonRegister.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Raleway",
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _authService.createUserWithEmailAndPassword(_email, _password, _nameSurname, _number);
                    if(result == null) {
                      setState(() {
                        error = "Podaj email";
                      });
                    } else {
                      print("Zarejestrowałeś sie poprawnie");
                    }
                  }
                },
                elevation: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
