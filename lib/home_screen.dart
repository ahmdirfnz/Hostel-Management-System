import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/facility_page.dart';
import 'package:code/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

late User loggedinUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget> [
    HomePage(),
    FacilitiesPage(),
    ProfilePage(),
  ];

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Text('Other Features'),
            ),
            ListTile(
              title: const Text('Registration Form'),
              onTap: () {
                Navigator.pushNamed(context, 'registration_screen');
              },
            ),
            ListTile(
              title: const Text('Report Form'),
              onTap: () {
                Navigator.pushNamed(context, 'report screen');
              },
            ),
            ListTile(
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pushNamed(context, 'calendar_screen');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
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

    CollectionReference users = FirebaseFirestore.instance.collection('student complaint');
    CollectionReference office_status = FirebaseFirestore.instance.collection('Office Status');

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
              )
            ),
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
          child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: users.doc('B081910068').get(),
                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
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
                              return const Text('Loading...');
                            },
                          ),
                          FutureBuilder(
                            future: office_status.doc('status').get(),
                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                return Card(
                                  color: _checkOfficeStatus(data['status']),
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
                                );

                              }
                              return const Text('Loading...');
                            },
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
                                child: Center(child: Text('Bus Schedule')),
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



