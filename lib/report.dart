import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class UserComplaint {
  final String matricNumber;
  final String roomNumber;
  final String complaintType;
  final String complaint;

  UserComplaint({
    this.matricNumber = "",
    this.roomNumber = "",
    this.complaintType = "",
    this.complaint = "",

  });

  Map<String, dynamic> toJson() => {
    'matricNumber': matricNumber,
    'roomNumber': roomNumber,
    'complaintType': complaintType,
    'complaint': complaint,

  };
}


class _ReportFormState extends State<ReportForm> {

  final _formKey = GlobalKey<FormState>();

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  final matricNumberController = TextEditingController();
  final roomNumberController = TextEditingController();
  final complaintController = TextEditingController();

  String selectedValue = 'Room';

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future createUser(UserComplaint usercomplaint) async {
    final docUserComplaint = FirebaseFirestore.instance.collection('student complaint').doc(usercomplaint.matricNumber);

    final json = usercomplaint.toJson();
    await docUserComplaint.set(json);

    // Upload Image to firebase

    final path = '${usercomplaint.matricNumber}/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Form',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(('Report Form')),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(25),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: matricNumberController,
                        decoration: const InputDecoration(
                          labelText: "Matric Number",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter matric number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: "Complaint Type",
                          // filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: <String>['Room', 'Bus', 'Toilet', 'Lift', 'Food'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: roomNumberController,
                        decoration: const InputDecoration(
                          labelText: "Room Number",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: complaintController,
                        decoration: const InputDecoration(
                            labelText: 'Enter Your Concern Here'
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: null, // <-- SEE HERE
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                          onPressed: selectImage,
                        child: const Text('Upload Image', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final userComplaint = UserComplaint(
                            matricNumber: matricNumberController.text,
                            roomNumber: roomNumberController.text,
                            complaintType: selectedValue,
                            complaint: complaintController.text,
                          );
                          createUser(userComplaint);
                          Navigator.pushNamed(context, "home_screen");

                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
