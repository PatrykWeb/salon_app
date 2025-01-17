import 'dart:async';

import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_app/models/User.dart';


class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firebaseDatabase = FirebaseDatabase.instance.reference();

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

   Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
      .map(_userFromFirebase);
   }

  Future createUserWithEmailAndPassword(String email, String password, String nameSurname, int number) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      _firebaseDatabase.child("Users").child(user.uid).set({
        "uid": user.uid, 
        "nameSurname": nameSurname, 
        "number": number,
        "email": email,
        "managment": false, 
        "manager": false, 
        "employee": false, 
        "boughtService": false,
        "serviceBoughtName": ""
      });
      return _userFromFirebase(user);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logIn(String email, String password) async {
    try {
     AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userFromFirebase(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future logOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future givesDatabaseRecord() async {
    _firebaseDatabase.child("Users").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        print(value["nameSurname"]);
        return value;
       });
    });
  }
  Future addCategory(String category, String categoryDesc) async {
    _firebaseDatabase.child("Category").child(category).set({
      "Category": category, 
      "Description": categoryDesc
    });
  }
  Future addProduct(String category, String product, String productDesc, int timeProduct, int priceProduct) async {
    _firebaseDatabase.child("Category").child(category).child("Products").child(product).set({
      "productName": product, 
      "productDesc": productDesc, 
      "timeProduct": timeProduct, 
      "priceProduct": priceProduct, 
      "category": category
    });
  }
    Future addEmployee(String uid) async {
    _firebaseDatabase.child("Users").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        if(value["uid"] == uid) {
         _firebaseDatabase.child("Users").child(uid).update({
              "employee": true
          });
        } else {
          print('Nie ma takiego uid');
          return null;
        }
       });
    });
  }

  Future addManager(String uid) async {
    _firebaseDatabase.child("Users").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        if(value["uid"] == uid) {
         _firebaseDatabase.child("Users").child(uid).update({
              "manager": true
          });
        } else {
          print('Nie ma takiego uid');
          return null;
        }
       });
    });
  }
}
