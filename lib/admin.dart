import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admin Page'),
        ),
        body: Center(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.green,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Report Status', style: TextStyle(color: Colors.white),)),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.green,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Office Hours', style: TextStyle(color: Colors.white),)),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.blue,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Bus Schedule', style: TextStyle(color: Colors.white),)),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Bus')),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Bus')),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.red,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: const SizedBox(
                            child: Center(child: Text('Emergency', style: TextStyle(color: Colors.white),)),
                            width: 170.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
