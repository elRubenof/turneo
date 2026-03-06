part of 'auth_screen.dart';

class _AuthController {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> googleSignIn() async {
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
      return null;
    }
  }
}
