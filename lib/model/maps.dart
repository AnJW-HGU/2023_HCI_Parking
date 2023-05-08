import 'package:cloud_firestore/cloud_firestore.dart';

class Maps {
  Maps({
    this.empty,
    this.img,
    this.time,
    this.today,
  });

  String? empty;
  String? img;
  String? time;
  String? today;

  Maps copyWith({
    String? empty,
    String? img,
    String? time,
    String? today,
  }) =>
      Maps(
        empty: empty ?? this.empty,
        img: img ?? this.img,
        time: time ?? this.time,
        today: today ?? this.today,
      );

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        empty: json['empty'],
        img: json['img'],
        time: json['time'],
        today: json['today'],
      );

  factory Maps.fromSnapshot(DocumentSnapshot ss) => Maps(
        empty: ss.get('empty'),
        img: ss.get('img'),
        time: ss.get('time'),
        today: ss.get('today'),
      );

  Map<String, dynamic> toJson() => {
        'empty': empty,
        'img': img,
        'time': time,
        'today': today,
      };
}
