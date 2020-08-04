import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/pages/menu_homepage/Settings.dart';
import 'package:salon_app/words/models.dart';
import 'package:salon_app/services/auth_service.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final firebaseDatabase = FirebaseDatabase.instance.reference().child("Users");
  String nameCompany, registerServices;
  dynamic getName;
  bool getManagment;
  bool getCheckBoughtService;
  String checkBoughtService;
  String getNameBoughtService, nameBoughtService;

  Future<String> getWordJson() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }

  Future getWord() async {
    String wordsAssets = await getWordJson();
    final wordsParse = jsonDecode(wordsAssets);
    Words words = Words.fromJson(wordsParse);
    setState(() {
      nameCompany = words.nameCompany;
      registerServices = words.registerServices;
    });
  }

  Future getDateDatabase() async {
    final FirebaseUser userCurrent = await FirebaseAuth.instance.currentUser();
    dynamic getCurrentUser = userCurrent.uid;
    firebaseDatabase.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        setState(() {
          getName = value["nameSurname"];
          getManagment = value["managment"];
          getCheckBoughtService = value["boughtService"];

        });
        if (!getCheckBoughtService) {
          setState(() {
            checkBoughtService = "Nie jesteś aktualnie zarejestrowany";
            nameBoughtService = "Nie zarejestrowany";
          });
        } else {
          setState(() {
            checkBoughtService = "Jesteś zarejestrowany na godzine: ";
            nameBoughtService = value["serviceBoughtName"];
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getWord();
    getDateDatabase();
  }

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.security),
              onPressed: () => authService.logOut(),
              color: Colors.purple[300],
            ),
          ],
          title: Text(
            nameCompany.toString(),
            style: TextStyle(
                color: Colors.purple[300],
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueGrey[100],
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.grey[300],
                        spreadRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(51),
                      bottomLeft: Radius.circular(51)),
                  color: Colors.white),
              child: Hero(
                tag: "card",
                child: InkWell(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 31, vertical: 21),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.purple[300],
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  registerServices.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontSize: 16.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.event,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    nameBoughtService.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  contentPadding: EdgeInsets.all(30.0),
                                  subtitle: Text(
                                    checkBoughtService.toString(),
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontFamily: "Raleway"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            CustomContainer(
              child: Row(
                children: <Widget>[],
              ),
            )
          ],
        )));
  }
}

// Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(30.0),
//   ),
//   color: Colors.purple[300],
//   child: Container(
//     color: Colors.white,
//     child: Text(
//       "Nie jesteś aktualnie umówiony",
//       style: TextStyle(
//           color: Colors.white,
//           fontFamily: "Raleway",
//           fontSize: 20.0),
//       textAlign: TextAlign.center,
//     ),
//   ),
// )
