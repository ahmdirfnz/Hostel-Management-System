import 'dart:async';

import 'package:code/calendar.dart';
import 'package:code/registration.dart';
import 'package:code/report.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
  // This widget is the root of your application.
  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently is signed out!');
      } else {
        print('User is signed in');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null ? 'welcome_screen' : 'home_screen',
      routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'signup_screen': (context) => const RegistrationScreen(),
        'login_screen': (context) => const LoginScreen(),
        'home_screen': (context) => const HomeScreen(),
        'registration_screen': (context) => const MyRegister(),
        'room_screen': (context) => const BookingRoom(matricNumber: '',),
        'info_screen': (context) => const InfoPage(matricNumber: '',),
        'calendar_screen': (context) => DynamicEvent(),
        'report screen': (context) => const ReportForm(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
