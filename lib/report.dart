import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}


class _ReportFormState extends State<ReportForm> {

  final _formKey = GlobalKey<FormState>();

  String selectedValue = 'Room';

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
                    const TextField(
                      decoration: InputDecoration(
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
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
