import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = _AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _controller.googleSignIn,
          child: Text('Sign-in with Google'),
        ),
      ),
    );
  }
}
