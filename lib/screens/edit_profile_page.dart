import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/home_screen.dart';
import 'package:code/profile_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/firebaseDatabaseImage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future _uploadImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });

    final path = '${_auth.currentUser?.email.toString()}/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        // loggedinUser = user;
      }
      print(_auth.currentUser?.email);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
          title: const Text('Edit Profile'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    IconButton(
                        onPressed: _uploadImage,
                        icon: Icon(Icons.edit),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1, color: Colors.blue
                            )
                          ),
                          label: Center(child: Text('Username')),
                        ),
                        controller: usernameController,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.
                          collection('student').
                          doc(_auth.currentUser?.email.toString()).
                          update({'userName': usernameController.text});

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        child: const Text('Save'))
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }
}
