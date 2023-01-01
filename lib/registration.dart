import 'package:code/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();

}

class StudentUser {
  final String fullName;
  final String userName;
  final String matricNumber;
  final String mobileNumber;
  final String email;
  final String password;
  final String room;

  StudentUser({
    this.fullName = "",
    this.userName = "",
    this.matricNumber = "",
    this.mobileNumber = "",
    this.email = "",
    this.password = "",
    this.room = "",

  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'userName': userName,
    'matricNumber': matricNumber,
    'mobileNumber': mobileNumber,
    'email': email,
    'password': password,
    'room': room,

  };
}

class _MyRegisterState extends State<MyRegister> {

  bool _isObscure = true;

  final _auth = FirebaseAuth.instance;

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final matricNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _disableButton() {
    return fullNameController.text.isEmpty ||
           usernameController.text.isEmpty ||
           matricNumberController.text.isEmpty ||
           phoneNumberController.text.isEmpty ||
           emailController.text.isEmpty ||
           passwordController.text.isEmpty;
  }

  void _updateButton() {
    setState(() {
      _disableButton();
    });
  }

  Future createUser(StudentUser user) async {

    final docUser = FirebaseFirestore.instance.collection('student').doc(user.email);

    // final CollectionReference postRef = FirebaseFirestore.instance.collection('student');

    final json = user.toJson();
    await docUser.set(json);

  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
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
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    _updateButton();
                  },
                  controller: fullNameController,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          fullNameController.clear();
                        },
                      ),
                      hintText: "Enter Your Full Name",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    _updateButton();
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          usernameController.clear();
                        },
                      ),
                      hintText: "Enter Username",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _updateButton();
                  },
                controller: matricNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Matric Number',
                    hintText: 'Enter Your Matric Number',
                    prefixIcon: const Icon(Icons.school),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        matricNumberController.clear();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _updateButton();
                  },
                  controller: phoneNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    hintText: 'Enter Mobile Number',
                    prefixIcon: const Icon(Icons.phone),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        phoneNumberController.clear();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _updateButton();
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    prefixIcon: const Icon(Icons.email),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        emailController.clear();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _updateButton();
                  },
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
      floatingActionButton: _disableButton() ? null : showFab ? FloatingActionButton(
        onPressed: () async {
            final user = StudentUser (
            fullName: fullNameController.text,
            userName: usernameController.text,
            matricNumber: matricNumberController.text,
            mobileNumber: phoneNumberController.text,
            email: emailController.text,
            password: passwordController.text,
            room: "",
      );

            try {
              await _auth.createUserWithEmailAndPassword(
                  email: emailController.text, password: passwordController.text);
            } catch (e) {
              print(e);
            }
          createUser(user);

          _disableButton() ? null : Navigator.push(context, MaterialPageRoute(builder: (context) => BookingRoom(email: emailController.text,)));


        },
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ) : null,
    );
  }
}



class BookingRoom extends StatefulWidget {
  const BookingRoom({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _BookingRoomState createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {

  bool _flagA = true;
  bool _flagB = true;
  bool _flagC = true;
  bool _flagD = true;

  bool _disableButton() {
    return _flagA && _flagB && _flagC && _flagD;
  }

  void _updateButton() {
    setState(() {
      _disableButton();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please Select Available Room', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _flagA = !_flagA;
                            if(_flagA == false) {
                              _flagB = true;
                              _flagC = true;
                              _flagD = true;
                            }
                            _disableButton();

                          });
                          _flagA ? FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': ''}) : FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': 'SJ-J-3-08-A'});
                        },
                      style: TextButton.styleFrom(backgroundColor: _flagA ? Colors.green : Colors.red),
                        child: const Text('SJ-J-3-08-A', style: TextStyle(color: Colors.white),),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _flagC = !_flagC;
                          if(_flagC == false) {
                            _flagB = true;
                            _flagA = true;
                            _flagD = true;
                          }
                          _disableButton();
                        });
                        _flagC ? FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': ''}) : FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': 'SJ-J-3-08-C'});
                      },
                      style: TextButton.styleFrom(backgroundColor: _flagC ? Colors.green : Colors.red),
                      child: const Text('SJ-J-3-08-C', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _flagB = !_flagB;
                          if(_flagB == false) {
                            _flagA = true;
                            _flagC = true;
                            _flagD = true;
                          }
                          _disableButton();
                        });
                        // FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room B'});
                        _flagB ? FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': ''}) : FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': 'SJ-J-3-08-B'});
                      },
                      style: TextButton.styleFrom(backgroundColor: _flagB ? Colors.green : Colors.red),
                      child: const Text('SJ-J-3-08-B', style: TextStyle(color: Colors.white),),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _flagD = !_flagD;
                          if(_flagD == false) {
                            _flagB = true;
                            _flagC = true;
                            _flagA = true;
                          }
                          _disableButton();
                        });
                        _flagD ? FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': ''}) : FirebaseFirestore.instance.collection('student').doc(widget.email).update({'room': 'SJ-J-3-08-D'});

                      },
                      style: TextButton.styleFrom(backgroundColor: _flagD ? Colors.green : Colors.red),
                      child: const Text('SJ-J-3-08-D', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _disableButton() ? null : FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(email: widget.email,)));
        }),
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  CollectionReference users = FirebaseFirestore.instance.collection('student');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.email).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {

          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
              appBar: AppBar(
                title: const Text('Info Page'),
              ),
              body: Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      Card(
                        elevation: 13,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child:  SizedBox(
                          width: 350,
                          height: 200,
                          child: Center(
                              child: Text("Full Name: ${data['fullName']}\n"
                              "Matric Number: ${data['matricNumber']}\n"
                                  "Room Number: ${data['room']}"),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "home_screen");
                  // FirebaseFirestore.instance.collection('student').add({'text': 'data added'});
                },
                tooltip: 'Next Page',
                child: const Icon(Icons.navigate_next),
              ),
            );

        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Info Page'),
          ),
        );
        },
    );
    //
  }
}
