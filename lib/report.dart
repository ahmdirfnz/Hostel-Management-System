import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Form',
      home: Scaffold(
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
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
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
