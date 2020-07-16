import 'package:flutter/material.dart';
import 'package:salon_app/services/auth_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email;
  String _password;
  String error;

  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zarejestruj swoje konto",
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
                validator: (value) => value.isEmpty ? "Podaj email" : null,
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
                  labelText: "Email",
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
                validator: (value) => value.length < 6 ? "Hasło musi mieć minimum 6 znaków" : null,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Password",
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
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Name and surname",
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
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Numer telefonu",
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.0,
                      color: Colors.grey[500]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _authService.createUserWithEmailAndPassword(_email, _password);
                    if(result == null) {
                      setState(() {
                        error = "Podaj email";
                      });
                    } else {
                      print("Zarejestrowałeś sie poprawnie");
                    }
                  }
                  print(_email);
                  print(_password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
