import 'dart:async';

import 'package:code/calendar.dart';
import 'package:code/registration.dart';
import 'package:code/report.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _doneOnboarding = false;

  void _checkShowOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var doneOnboarding = (prefs.getBool('done_onboarding') ?? false);
    setState(() {
      _doneOnboarding = doneOnboarding;

    });
    await prefs.setBool('done_onboarding', true);
    print(_doneOnboarding);
  }

  // This widget is the root of your application.
  late StreamSubscription<User?> user;
  @override
  void initState() {

    super.initState();
    _checkShowOnboarding();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently is signed out!');
      } else {
        print('User is signed in');
      }
    });
  }

  // @override
  // void dispose() {
  //   user.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'signup_screen': (context) => const RegistrationScreen(),
        'login_screen': (context) => const LoginScreen(),
        'home_screen': (context) => const HomeScreen(),
        'registration_screen': (context) => const MyRegister(),
        'room_screen': (context) => const BookingRoom(email: '',),
        'info_screen': (context) => const InfoPage(email: '',),
        'calendar_screen': (context) => DynamicEvent(),
        'report screen': (context) => const ReportForm(),
      },
      home: _doneOnboarding ? (FirebaseAuth.instance.currentUser == null ? LoginScreen() : HomeScreen()) : const MyRegister(),
    );
  }
}
