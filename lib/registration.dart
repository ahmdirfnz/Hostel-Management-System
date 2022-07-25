import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();

}

class User {
  final String fullName;
  final String userName;
  final String matricNumber;
  final int mobileNumber;
  final String email;
  final String password;
  final String room;

  User({
    this.fullName = "",
    this.userName = "",
    this.matricNumber = "",
    this.mobileNumber = 0,
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

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final matricNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future createUser(User user) async {

    final docUser = FirebaseFirestore.instance.collection('student').doc(user.matricNumber);

    // final CollectionReference postRef = FirebaseFirestore.instance.collection('student');

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
                  keyboardType: TextInputType.text,
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
            room: "",
      );

          createUser(user);
            setState(() {

              Navigator.pushNamed(context, "room_screen");
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => BookingRoom(matricNumber: matricNumberController.text,)));

        },
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}



class BookingRoom extends StatefulWidget {
  const BookingRoom({Key? key, required this.matricNumber}) : super(key: key);

  final String matricNumber;

  @override
  _BookingRoomState createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {

  bool _flagA = true;
  bool _flagB = true;
  bool _flagC = true;
  bool _flagD = true;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Center(
        child: Row(
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
                      });
                      _flagA ? FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room A'}) : FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': ''});
                    },
                  style: TextButton.styleFrom(backgroundColor: _flagA ? Colors.green : Colors.red),
                    child: const Text('Room A', style: TextStyle(color: Colors.white),),
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
                    });
                    _flagC ? FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room C'}) : FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': ''});
                  },
                  style: TextButton.styleFrom(backgroundColor: _flagC ? Colors.green : Colors.red),
                  child: const Text('Room C', style: TextStyle(color: Colors.white),),
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
                    });
                    // FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room B'});
                    _flagB ? FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room B'}) : FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': ''});
                  },
                  style: TextButton.styleFrom(backgroundColor: _flagB ? Colors.green : Colors.red),
                  child: const Text('Room B', style: TextStyle(color: Colors.white),),
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
                    });
                    _flagD ? FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': 'Room D'}) : FirebaseFirestore.instance.collection('student').doc(widget.matricNumber).update({'room': ''});

                  },
                  style: TextButton.styleFrom(backgroundColor: _flagD ? Colors.green : Colors.red),
                  child: const Text('Room D', style: TextStyle(color: Colors.white),),
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
          // FirebaseFirestore.instance.collection('student').add({'text': 'data added'});
        },
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
