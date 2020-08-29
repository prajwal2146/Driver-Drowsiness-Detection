import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation {
  Future<String> getCurrentUser();
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}



