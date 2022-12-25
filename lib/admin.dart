import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Admin Page',
      home: Scaffold(
        body: Center(
          child: Text('This is admin page'),
        ),
      ),
    );
  }
}
