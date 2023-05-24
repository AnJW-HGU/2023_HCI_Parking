import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  Data({
    this.empty,
  });

  String? empty;

  Data copyWith({
    String? empty,
  }) =>
      Data(
        empty: empty ?? this.empty,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        empty: json['자리'],
      );

  factory Data.fromSnapshot(DocumentSnapshot ss) => Data(
        empty: ss.get('자리'),
      );

  Map<String, dynamic> toJson() => {
        '자리': empty,
      };
}
