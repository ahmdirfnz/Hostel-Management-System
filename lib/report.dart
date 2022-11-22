import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final matricNumberController = TextEditingController();
  final roomNumberController = TextEditingController();
  final complaintController = TextEditingController();

  String selectedValue = 'Room';

  Future createUser(UserComplaint usercomplaint) async {
    final docUserComplaint = FirebaseFirestore.instance.collection('student complaint').doc(usercomplaint.matricNumber);

    final json = usercomplaint.toJson();
    await docUserComplaint.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Form',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
                      items: <String>['Room', 'Bus', 'Toilet', 'Lift'].map<DropdownMenuItem<String>>((String value) {
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
                      onPressed: () {
                        final userComplaint = UserComplaint(
                          matricNumber: matricNumberController.text,
                          roomNumber: roomNumberController.text,
                          complaint: complaintController.text
                        );
                        createUser(userComplaint);

                      },
                      child: const Text('Submit'),
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
