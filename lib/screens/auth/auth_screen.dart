import 'package:flutter/material.dart';
import 'package:turneo/screens/auth/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = AuthController();

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
