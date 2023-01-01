import 'package:flutter/material.dart';

class FacilitiesPage extends StatefulWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.green,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Report Status', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Office Hours', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Permohonan\nSticker Kenderaan', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Timetable', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.brown,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Permohonan \nTinggal Luar', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: const SizedBox(
                          child: Center(child: Text('Emergency', style: TextStyle(color: Colors.white),)),
                          width: 170.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
