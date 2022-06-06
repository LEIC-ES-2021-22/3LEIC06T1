import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData{
  final int id;
  final String title;
  final String body;

  const NotificationData({
    @required int this.id,
    @required String this.title,
    @required String this.body,
  });

  @override
  String toString() {
    return id.toString() + ' ' + title + ' ' + body;
  }

  static NotificationData parseString(String notif_string){
    final List<String> data = notif_string.split(' ');
    return NotificationData(
        id: int.parse(data[0]),
        title: data[1],
        body: data[2] + ' ' + data[3]
    );
  }

  //factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  //Map<String, dynamic> toJson() => _$NotificationDataToJson(this);

}