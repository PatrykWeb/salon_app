import 'package:firebase_auth/firebase_auth.dart';
import 'package:salon_app/models/User.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

   Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
      .map(_userFromFirebase);
   }

  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
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
