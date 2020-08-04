import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/pages/Register.dart';
import 'package:salon_app/pages/menu_homepage/Account.dart';
import 'package:salon_app/pages/menu_homepage/Home_menu.dart';
import 'package:salon_app/pages/menu_homepage/Settings.dart';
import 'package:salon_app/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_app/words/models.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeLess extends StatelessWidget {
  const HomeLess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String notificationLogout,
      appNameHome,
      navigationBottomHome,
      navigationBottomAccount,
      navigationBottomSettings,
      navigationBottomRegister;

  Future<String> getWordFromAssets() async {
    return await rootBundle.loadString("lib/words/wordsPL.json");
  }

  Future getWord() async {
    String getAssetsString = await getWordFromAssets();
    final parseAssets = jsonDecode(getAssetsString);
    Words words = Words.fromJson(parseAssets);
    setState(() {
      notificationLogout = words.notificationLogout;
      appNameHome = words.appNameHome;
      navigationBottomHome = words.navigationBottomHome;
      navigationBottomAccount = words.navigationBottomAccount;
      navigationBottomSettings = words.navigationBottomSettings; 
      navigationBottomRegister = words.navigationBottomRegister;
    });
  }

  @override
  void initState() {
    super.initState();
    getWord();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeMenu(),
    Account(),
    Settings(),
    Register()
  ];

  AuthService authService = AuthService();

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SnakeNavigationBar(
        onPositionChanged: onTappedBar,
        currentIndex: _currentIndex,
        style: SnakeBarStyle.pinned,
        snakeShape: SnakeShape.indicator,
        snakeColor: Colors.purple,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // shape: ShapeBorder.lerp(30.0, b, t)
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_none),
            title: Text(
              navigationBottomHome.toString(),
              style: TextStyle(
                color: Colors.purple,
                fontFamily: "Raleway",
              ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text(
                navigationBottomAccount.toString(),
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "Raleway",
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_backup_restore),
              title: Text(
                navigationBottomSettings.toString(),
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "Raleway",
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text(
                navigationBottomRegister.toString(),
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "Raleway",
                ),
              )),
        ],
      )
    );
  }
}
