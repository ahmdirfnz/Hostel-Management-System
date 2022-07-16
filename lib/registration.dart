import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            SizedBox(
              height: 75.0,
            ),
            const TextField(
              decoration: InputDecoration(
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
            SizedBox(
              height: 15.0,
            ),
            const TextField(
              decoration: InputDecoration(
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
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
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
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
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
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
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
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Your Password',
                prefixIcon: Icon(Icons.password),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.pushNamed(context, 'room_booking');
        }),
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class BookingRooom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: const Center(
        child: Text(
          'Booking Room Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
