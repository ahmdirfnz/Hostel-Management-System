import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hostel Management',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0,),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login_screen');
              },
              child: const Text(
                  'Log In',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
              )
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'signup_screen');
                },
                child: const Text(
                    'Register',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),

                )
            ),
          ],
        ),
      ),
    );
  }
}
