import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        padding: EdgeInsets.fromLTRB(30.0, 210.0, 30.0, 0.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
