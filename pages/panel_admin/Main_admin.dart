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
                                  onTap: () => print("Test"),
                                  leading: Icon(
                                    Icons.call_split,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  title: Text(
                                    "Dodaj kategorie",
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
                                  onTap: () => print("Title2"),
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
                                        fontFamily: "Raleway"),
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
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
