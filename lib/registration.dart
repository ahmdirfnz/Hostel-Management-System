import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  bool _isObscure = true;

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final matricNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future createUser(User user) async {

    final docUser = FirebaseFirestore.instance.collection('student').doc();

    final json = user.toJson();
    await docUser.set(json);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            children: <Widget>[
              const Center(
                  child: Text(
                'Registration Page',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              )),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      hintText: "Enter Your Full Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      hintText: "Enter Username",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                controller: matricNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Matric Number',
                    hintText: 'Enter Your Matric Number',
                    prefixIcon: Icon(Icons.school),
                    suffixIcon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    hintText: 'Enter Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final user = User (
            fullName: fullNameController.text,
            userName: usernameController.text,
            matricNumber: matricNumberController.text,
            mobileNumber: int.parse(phoneNumberController.text),
            email: emailController.text,
            password: passwordController.text,
      );
          setState(() {
            Navigator.pushNamed(context, "room_screen");
          });
          createUser(user);

        },
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class User {
  final String fullName;
  final String userName;
  final String matricNumber;
  final int mobileNumber;
  final String email;
  final String password;

  User({
    this.fullName = "",
    this.userName = "",
    this.matricNumber = "",
    this.mobileNumber = 0,
    this.email = "",
    this.password = "",

});

  Map<String, dynamic> toJson() => {
  'fullName': fullName,
  'userName': userName,
  'matricNumber': matricNumber,
  'mobileNumber': mobileNumber,
  'email': email,
  'password': password,

  };
}

class BookingRoom extends StatefulWidget {
  const BookingRoom({Key? key}) : super(key: key);

  @override
  _BookingRoomState createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Card(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text('Room A'),
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text('Room C'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Card(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text('Room B'),
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text('Room D'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.pushNamed(context, 'info_screen');
        }),
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
      ),
      body: Center(
          child: ListView(
        children: const [
          Card(
              child: ListTile(
            title: Text("List Item 1"),
          )),
          Card(
            child: ListTile(
              title: Text("List Item 2"),
            ),
          ),
          Card(
              child: ListTile(
            title: Text("List Item 3"),
          )),
        ],
        padding: EdgeInsets.all(10),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('student').add({'text': 'data added'});
        },
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
