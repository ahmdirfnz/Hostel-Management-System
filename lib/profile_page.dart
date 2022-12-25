import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 100,),
          CircleAvatar(
            radius: 40.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/zorro.jpeg'),
          ),
          SizedBox(height: 5,),
          Text('@ahmdirfnz'),
          SizedBox(height: 20,),
          Text('AHMAD IRFAN BIN HARMAN'),
          SizedBox(height: 10,),
          Text('B081910068'),
          SizedBox(height: 10,),
          Text('SJ-J-3-08-A'),
          SizedBox(height: 10,),
          Text('irfanz6985@gmail.com'),
          SizedBox(height: 10,),
          Text('329-I, Jalan Teratai 1, Taman Bunga\nRaya, Bukit Beruang, 75450, Melaka'),

        ],
      ),
    );
  }
}
