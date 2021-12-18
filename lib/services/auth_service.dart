import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_app/model/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signIn(String email, String password) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credentials.user);
  }

  Future<User?> createUser(String email, String password) async {
    final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credentials.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
