import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/services/auth_service.dart';

class MainAdmin extends StatefulWidget {
  MainAdmin({Key key}) : super(key: key);

  @override
  _MainAdminState createState() => _MainAdminState();
}

class _MainAdminState extends State<MainAdmin> {
  dynamic categoryList;
  final _formKey = GlobalKey<FormState>();
  AuthService _authService = AuthService();
  final _firebaseDatabase = FirebaseDatabase.instance.reference().child("Category").orderByChild("Category");
  String category, categoryDesc;
  dynamic i;


    Widget _buildCategory({Map category}) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            category["Category"], 
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ],
      ),
    );
  }

    Future giveCategoryRecords() async {
      _firebaseDatabase.once().then((DataSnapshot snaphot) {
      Map<dynamic, dynamic> values = snaphot.value;
      // for(i in values) {
      //   setState(() {
      //     categoryList = i;
      //   });
      // }
    
      //   // values.forEach((key, value) {
      //   //   setState(() {
      //   //     categoryList = key;
      //   //   });
      //   // });
    });
  }

  @override
  void initState() { 
      super.initState();
      giveCategoryRecords();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.purple[300]),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Panel właściciela",
                style: TextStyle(
                    fontFamily: "Raleway",
                    color: Colors.purple[300],
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Zarządzaj aplikacją za pomocą sekcji właściciela",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Raleway",
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              )
            ],
          )),
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(51.0),
                        bottomLeft: Radius.circular(51.0)),
                    color: Colors.white),
                child: Hero(
                  tag: "card",
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 31.0, horizontal: 21.0),
                    child: Column(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.purple[300],
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  onTap: () => {
                                    showDialog(
                                      context: context, 
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(17.0)
                                          ),
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                                            height: 240.0,
                                            child: Form(
                                              key: _formKey,
                                              child: Column(
                                              children: <Widget>[ 
                                                TextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      category = value;
                                                    });
                                                  },
                                                  validator: (value) => value.isEmpty ? "Musisz wpisać nazwe kategorii" : null,
                                                  cursorColor: Colors.purple,
                                                  autofocus: true,
                                                  decoration: InputDecoration(
                                                    labelStyle: TextStyle(
                                                      color: Colors.purple, 
                                                      fontFamily: "Raleway",
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    labelText: "Kategoria",
                                                    hintText: "Nazwa kategorii",
                                                    hintStyle: TextStyle(
                                                      fontFamily: "Raleway"
                                                    ), 
                                                    focusColor: Colors.purple[300], 
                                                    contentPadding: EdgeInsets.all(10.0),
                                                    border: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.purple)
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.purple)
                                                    )
                                                  ),
                                                ),
                                               TextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      categoryDesc = value;
                                                    });
                                                  },
                                                  validator: (value) => value.isEmpty ? "Musisz wpisać opis kategorii" : null,
                                                  cursorColor: Colors.purple,
                                                  autofocus: true,
                                                  decoration: InputDecoration(
                                                    labelStyle: TextStyle(
                                                      color: Colors.purple, 
                                                      fontFamily: "Raleway",
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    labelText: "Opis",
                                                    hintText: "Wpisz opis kategorii",
                                                    hintStyle: TextStyle(
                                                      fontFamily: "Raleway"
                                                    ), 
                                                    focusColor: Colors.purple[300], 
                                                    contentPadding: EdgeInsets.all(10.0),
                                                    border: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.purple)
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.purple)
                                                    )
                                                  ),
                                                ),
                                                SizedBox(height: 30.0,),
                                                RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30.0)
                                                  ),
                                                  padding: EdgeInsets.only(left: 100.0, right: 100.0),
                                                  onPressed: () {
                                                    if(_formKey.currentState.validate()) {
                                                      _formKey.currentState.reset();
                                                      dynamic result = _authService.addCategory(category, categoryDesc);
                                                      if(result == null) {
                                                        print("Dodałeś rekord pomyślnie");
                                                      } else {
                                                      print("Dodales rekord pomyslnie");
                                                      }
                                                    } 
                                                  }, 
                                                  color: Colors.purple[300],
                                                  child: Text(
                                                    "Dodaj",
                                                    style: TextStyle(
                                                      fontFamily: "Raleway", 
                                                      color: Colors.white, 
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          )
                                        );
                                      }
                                    )
                                  },
                                  leading: Icon(
                                    Icons.call_split,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  title: Text(
                                    "Nazwa kategorii",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    "Stostuj się do wytycznych podczas dodawania kategorii!",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        color: Colors.white60),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 0.0,
                                color: Colors.purple[300],
                                child: ListTile(
                                  onTap: () => {
                                    showDialog(
                                      context: context, 
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(17.0)
                                          ),
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                                            height: 300.0,
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),),
                                                  TextFormField(
                                                    autofocus: true,
                                                    cursorColor: Colors.purple[300],
                                                    decoration: InputDecoration(
                                                      labelText: "Produkt", 
                                                      hintText: "Nazwa produktu",
                                                      hintStyle: TextStyle(
                                                        fontFamily: "Raleway"
                                                      ),
                                                      labelStyle: TextStyle(
                                                        fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.purple[300]
                                                      ), 
                                                      border: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      )
                                                    ),
                                                  ),
                                                TextFormField(
                                                    autofocus: true,
                                                    cursorColor: Colors.purple[300],
                                                    decoration: InputDecoration(
                                                      labelText: "Opis", 
                                                      hintText: "Nazwa produktu",
                                                      hintStyle: TextStyle(
                                                        fontFamily: "Raleway"
                                                      ),
                                                      labelStyle: TextStyle(
                                                        fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.purple[300]
                                                      ), 
                                                      border: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      )
                                                    ),
                                                  ),
                                                TextFormField(
                                                    autofocus: true,
                                                    cursorColor: Colors.purple[300],
                                                    decoration: InputDecoration(
                                                      labelText: "Przewidywany czas", 
                                                      hintText: "Wpisz przewidywany czas",
                                                      hintStyle: TextStyle(
                                                        fontFamily: "Raleway"
                                                      ),
                                                      labelStyle: TextStyle(
                                                        fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.purple[300]
                                                      ), 
                                                      border: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.purple)
                                                      )
                                                    ),
                                                  ), 
                                                  RaisedButton(
                                                    onPressed: () => print(categoryList),
                                                    child: Text("adadadadada"),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  },
                                  leading: Icon(
                                    Icons.add_to_photos,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Dodaj produkt",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    "Stostuj sie do wytycznych, aby dodac produkt",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontFamily: "Raleway",
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "made",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Raleway",
                  ),
                ),
                SizedBox(width: 5.0,),
                Icon(
                  Icons.code,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "by wisewayapps.com",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Raleway",
                  ),
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}