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
          backgroundColor: Colors.purple[300],
          centerTitle: true,
          title: Text(
            "Panel administratora 0.1",
            style: TextStyle(fontFamily: "Raleway"),
          ),
        ),
        backgroundColor: Colors.blueGrey[100],
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey[300],
                          spreadRadius: 5.0)
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)),
                    color: Colors.white),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        minWidth: 150.0,
                        height: 150.0,
                        child: RaisedButton.icon(
                          label: Text(
                            "Dodaj kategorie",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Raleway"),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () => {},
                          color: Colors.purple[300],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        minWidth: 150.0,
                        height: 150.0,
                        child: RaisedButton.icon(
                          label: Text(
                            "Dodaj kategorie",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Raleway"),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () => {},
                          color: Colors.purple[300],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
