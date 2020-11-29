import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  String _uid;
  String _email;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String verificationId;

  Future<bool> signIn(_email, _password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signUp(_email, _password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map> getUserData() async {
    var retVal = {};
    try {
      FirebaseUser firebaseUser = await _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        _uid = firebaseUser.uid;
//        _email = firebaseUser.email;
//        String name = firebaseUser.displayName;
//        Map data = {'uid': _uid, 'email': _email, 'name': name};
        Map data = {'uid': _uid};
        print(data);
        retVal = data;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<bool> onStartUp() async {
    bool retVal = false;
    try {
      FirebaseUser firebaseUser = await _firebaseAuth.currentUser;
      _uid = firebaseUser.uid;
//      _email = firebaseUser.email;
      retVal = true;
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}