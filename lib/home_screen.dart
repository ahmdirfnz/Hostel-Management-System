import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/facility_page.dart';
import 'package:code/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/firebaseDatabaseImage.dart';

late User loggedinUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('student');
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FacilitiesPage(),
    ProfilePage(),
  ];

  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, 'welcome_screen');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Hostel Management'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(_auth.currentUser?.email).get(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      return Text('${data['userName']}', style: const TextStyle(fontWeight: FontWeight.bold),);
                    }
                    return const Text('Loading...');
                  },

              ),
                accountEmail: Text('${_auth.currentUser?.email}'),
              currentAccountPicture: FutureBuilder(
                  future: FireStoreDataBaseImage('zorro.jpeg').getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(snapshot.data.toString()),
                      );
                    }
                    return const Center(child: CircularProgressIndicator(),);
                  }
              ),
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Registration Form'),
              onTap: () {
                Navigator.pushNamed(context, 'registration_screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Report Form'),
              onTap: () {
                Navigator.pushNamed(context, 'report screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pushNamed(context, 'calendar_screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'Facility',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color flavorColor = Colors.blueAccent;
  final String flavor = 'NEWS';

  Stream documentStream = FirebaseFirestore.instance.collection('Office Status').doc('status').snapshots();

  bool _checkStatus(String status_now) {
    if (status_now == 'Accepted') {
      return true;
    }
    return false;
  }

  Color _checkOfficeStatus(String status_office) {
    if (status_office == "Open") {
      return Colors.green;
    } else if (status_office == "Break") {
      return Colors.blueAccent;
    } else if (status_office == "Close Soon") {
      return Colors.orange;
    }
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('student complaint');
    CollectionReference office_status =
        FirebaseFirestore.instance.collection('Office Status');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search your building location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                )),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage("https://www.shutterstock.com/image-photo/key-moving-house-real-estate-260nw-283502801.jpg"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.only(left: 8.0),
                  height: 150,
                  width: 300,
                  child: Center(
                      child: Text(
                    'Pemulangan Kunci',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor, style: TextStyle(color: Colors.white),)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  child: Center(child: Text(flavor)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance.collection('student complaint').doc('B081910068').snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                          if (snapshot.hasError) {
                            return const Center(child: Text('Something went wrong'));
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: Text('Loading...'));
                          }

                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          return Card(
                            color: _checkStatus(data['status']) ? Colors.green :Colors.red,
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
                          );
                        }
                    ),
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance.collection('Office Status').doc('status').snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text('Loading...');
                          }

                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                            return Card(
                                        color: _checkOfficeStatus(data['status']),
                                        child: InkWell(
                                          onTap: () {
                                            print("tapped");
                                          },
                                          child: const SizedBox(
                                            child: Center(
                                                child: Text(
                                              'Office Hours',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                            width: 170.0,
                                            height: 120.0,
                                          ),
                                        ),
                                      );
                        }
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
                      color: Colors.brown,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Cafe', style: TextStyle(color: Colors.white),)),
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
                          child: Center(child: Text('Timetable')),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
