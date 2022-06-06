import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


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
    num id = int.parse(data[0]);
    String title = data[1];
    String body = data[2] + ' ' + data[3];

    if (DateTime.parse(body).compareTo(DateTime.now()) > 0 ){
      return NotificationData(
          id: id,
          title: title,
          body: body
      );
    }
    else{
      return null;
    }
  }

}