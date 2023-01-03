import 'dart:convert';
import 'package:code/model/lectureRoom.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<LectureRoom> rooms = [];
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();

  Future _loadRooms() async {
    try {
      var content = await rootBundle.loadString('assets/json/lecture_room.json');
      var response = jsonDecode(content);

      for (var json in response) {
        var room = LectureRoom.fromJson(json);
        rooms.add(room);
      }

    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          ),
          title: Text('News Page'),
        ),
        body: Center(child: Text('News Page')),
        ),
      );
  }
}
