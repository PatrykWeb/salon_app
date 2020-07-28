import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:salon_app/models/User.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


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
        "nameSurname": nameSurname, 
        "number": number
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
}
