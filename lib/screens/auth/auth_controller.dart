import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  late GoogleSignIn _googleSignIn;
  late FirebaseAuth _auth;

  AuthController() {
    _googleSignIn = GoogleSignIn.instance;
    _auth = FirebaseAuth.instance;
  }

  Future googleSignIn() async {
    try {
      await _googleSignIn.initialize();
      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      final user = await _auth.signInWithCredential(credential);
      return user;
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
