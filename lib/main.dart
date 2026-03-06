import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turneo/screens/auth/auth_screen.dart';
import 'package:turneo/utils/firebase_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseUtils.initialize();

  final user = await FirebaseUtils.getAuthUser();
  runApp(MyApp(user: user));
}

class MyApp extends StatefulWidget {
  final User? user;

  const MyApp({super.key, this.user});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late User? user = widget.user;

  @override
  void initState() {
    super.initState();

    FirebaseUtils.setUserListener((value) {
      if (mounted) setState(() => user = value);
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
