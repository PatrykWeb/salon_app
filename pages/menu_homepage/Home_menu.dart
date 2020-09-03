import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/pages/Register.dart';
import 'package:salon_app/pages/menu_homepage/Settings.dart';
import 'package:salon_app/pages/panel_admin/Main_admin.dart';
import 'package:salon_app/pages/panel_admin/Main_employee.dart';
import 'package:salon_app/words/models.dart';
import 'package:salon_app/services/auth_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final FirebaseAuth authUid = FirebaseAuth.instance;

  final _firebaseCategory = FirebaseDatabase.instance.reference().child("Category").orderByChild("Category");
  String nameCompany, registerServices, employeeSectionNameJson, detailsSectionNameJson, scrollRightText, scrollRightDetails;
  dynamic getName;
  bool getCheckBoughtService, getCheckManagment, getCheckEmployee;
  String checkBoughtService;
  String getNameBoughtService, nameBoughtService, employeeSectionName;
  dynamic employeeSectionIcon;

  AuthService authService = AuthService();

  Widget _categoryBuilder({Map category, index}) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.purple[300],
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.import_contacts, 
                    color: Colors.white,
                  ),
                  title: Text(
                    category["Category"], 
                    style: TextStyle(
                      color: Colors.white, 
                      fontFamily: "Raleway", 
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    category["Description"], 
                    style: TextStyle(
                      color: Colors.white54, 
                      fontFamily: "Raleway"
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  padding: EdgeInsets.only(left: 70.0, right: 70.0),
                  elevation: 0.0,
                  color: Colors.white,
                  onPressed: () {
                    print(index);
                  },
                  child: Text(
                    "Zabiegi z tej kategorii", 
                    style: TextStyle(
                      color: Colors.purple[300], 
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

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
      employeeSectionNameJson = words.employeeSectionNameJson;
      detailsSectionNameJson = words.detailsSectionNameJson;
      scrollRightText = words.scrollRightText;
      scrollRightDetails = words.scrollRightDetails;
    });
  }
  
  Future<DataSnapshot> getDateDatabase() async {
    var user = await FirebaseAuth.instance.currentUser();
    final firebaseDatabase = FirebaseDatabase.instance.reference().child("Users").child(user.uid);
    return await firebaseDatabase.once();
  }

  // Future checkPermissions() async {
  //   if (!getCheckManagment) {
  //     print("Nie posiadasz uprawnien");
  //   } else {
  //     authService.logOut();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getWord();
    getDateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30.0,
              color: Colors.purple[300],
            ),
            onPressed: () => authService.logOut()
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.font_download,
                color: Colors.purple[300],
              ),
              onPressed: () {
                if (getCheckManagment) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainAdmin()));
                  Fluttertoast.showToast(
                      msg: "Zalogowałeś się do panelu administratora", 
                      backgroundColor: Colors.purple[300]
                      );
                } else {
                  Fluttertoast.showToast(
                    msg: "Nie posiadasz uprawnień!", 
                    backgroundColor: Colors.purple[300], 
                    toastLength: Toast.LENGTH_SHORT
                  );
                }
              },
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
              child: Material(
                borderRadius: BorderRadius.circular(40.0),
                child: InkWell(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 31, vertical: 21),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FutureBuilder(
                            future: getDateDatabase(),
                            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                              if(snapshot.hasData) {
                                  getName = snapshot.data.value["nameSurname"];
                                  getCheckBoughtService = snapshot.data.value["boughtService"];
                                  getCheckManagment = snapshot.data.value["managment"];
                                  getCheckEmployee = snapshot.data.value["employee"];
                                  print(getCheckManagment);
                                if (!getCheckBoughtService) {
                                    checkBoughtService = "Nie jesteś aktualnie zarejestrowany";
                                    nameBoughtService = "Nie zarejestrowany";
                                } else {
                                    checkBoughtService = "Jesteś zarejestrowany na godzine: ";
                                    nameBoughtService = snapshot.data.value["serviceBoughtName"];
                                }
                                if (getCheckEmployee) {
                                    employeeSectionName = employeeSectionNameJson.toString();
                                    employeeSectionIcon = Icons.explicit;
                                } else if (getCheckManagment) {
                                    employeeSectionName = employeeSectionNameJson.toString();
                                    employeeSectionIcon = Icons.explicit;
                                } else {
                                    employeeSectionName = detailsSectionNameJson.toString();
                                    employeeSectionIcon = Icons.category;
                                }
                              }
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      elevation: 5.0,
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
                                          RaisedButton.icon(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0)),
                                            onPressed: () {
                                              if (getCheckManagment) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainEmployee(),
                                                    ));
                                              } else if (getCheckEmployee) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainEmployee(),
                                                    ));
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Register(),
                                                    ));
                                              }
                                            },
                                            padding:
                                                EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                                            icon: Icon(
                                              employeeSectionIcon,
                                              color: Colors.purple[300],
                                            ),
                                            label: Text(
                                              employeeSectionName.toString(),
                                              style: TextStyle(
                                                  color: Colors.purple[300],
                                                  fontFamily: "Raleway",
                                                  fontSize: 16.0),
                                            ),
                                            color: Colors.white,
                                            elevation: 0.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  scrollRightText.toString(), 
                  style: TextStyle(
                    color: Colors.black54, 
                    fontFamily: "Raleway",
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w600
                  ),
                ),
                Icon(
                  Icons.expand_more, 
                  color: Colors.black54,
                  size: 35.0,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  scrollRightDetails.toString(), 
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway"
                  ),
                )
              ],
            ),
            CustomContainer(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 238.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      height: 238.0,
                      child: FirebaseAnimatedList(
                        query: _firebaseCategory,
                        itemBuilder: (context, snapshot, animation, index) {
                          Map category = snapshot.value;
                          int indexCategory = index.sign;
                          return _categoryBuilder(category: category, index: indexCategory);
                        }, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
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