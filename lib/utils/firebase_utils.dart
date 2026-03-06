import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:turneo/firebase_options.dart';

class FirebaseUtils {
  static Future<void> initialize() async {
    // Initialize Firebase Core
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static Future<User?> getAuthUser() {
    return FirebaseAuth.instance.authStateChanges().first.timeout(
      const Duration(milliseconds: 500),
      onTimeout: () => null,
    );
  }

  static void setUserListener(Function(User? user) function) {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user != null) {
        try {
          await user.getIdToken(true);
        } catch (e) {
          await FirebaseAuth.instance.signOut();
        }
      }

      function(user);
    });
  }

  static List<NavigatorObserver> get navigatorObservers => [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ];
}
