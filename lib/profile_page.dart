import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/model/firebaseDatabaseImage.dart';
import 'package:code/screens/edit_profile_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

late User loggedinUser;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  CollectionReference users = FirebaseFirestore.instance.collection('student');
  final _auth = FirebaseAuth.instance;
  var url;

 void  _getProfilePicture() async {

   final ref = FirebaseStorage.instance.ref().child('zorro.jpeg');
   url = await ref.getDownloadURL();

  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getProfilePicture();
  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
      print(_auth.currentUser?.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        FutureBuilder(
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
        FutureBuilder<DocumentSnapshot>(
          future: users.doc(_auth.currentUser?.email.toString()).get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('@${data['userName']}'),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                            },
                            icon: const Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Name: '),
                              SizedBox(height: 10,),
                              Text('Matric number: '),
                              SizedBox(height: 10,),
                              Text('Room number: '),
                              SizedBox(height: 10,),
                              Text('Email: '),
                              SizedBox(height: 10,),
                              Text('Address: '),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data['fullName']}'),
                              const SizedBox(height: 10,),
                              Text('${data['matricNumber']}'),
                              const SizedBox(height: 10,),
                              Text('${data['room']}'),
                              const SizedBox(height: 10,),
                              Text('${data['email']}'),
                              const SizedBox(height: 10,),
                              const Text(
                                  '329-I, Jalan Teratai 1, Taman Bunga\nRaya, Bukit Beruang, 75450, Melaka'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: Text(
                'Loading...',
              ),
            );
          },
        ),
      ],
    );
  }
}
