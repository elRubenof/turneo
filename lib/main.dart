import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turneo/screens/auth/auth_screen.dart';
import 'package:turneo/utils/firebase_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseUtils.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    super.initState();

    FirebaseUtils.setUserListener((value) {
      setState(() => user = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: user == null ? AuthScreen() : const MyHomePage(),
      navigatorObservers: FirebaseUtils.navigatorObservers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final displayName = FirebaseAuth.instance.currentUser!.displayName!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Welcome back $displayName")));
  }
}
