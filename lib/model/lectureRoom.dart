class LectureRoom {
  String keyword;
  String name;
  String location;

  LectureRoom({required this.keyword, required this.name, required this.location});

  factory LectureRoom.fromJson(Map<String, dynamic> json) => LectureRoom(keyword: json['keyword'], name: json['name'], location: json['location']);

}