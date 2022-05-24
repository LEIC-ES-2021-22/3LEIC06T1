
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Service{
  final int id;
  final String name;
  final String description;
  final String startTime;
  final String endTime;


  Service(this.id, this.name, this.description,this.startTime,this.endTime){}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'begin': startTime,
      'end': endTime,
      'rooms': '',
      'subject': name
    };
  }

  @override
  String toString() {
    return '''$id - $name - $description - $startTime -  $endTime''';
  }

  bool isOpen(TimeOfDay timeN, DateTime dateTime){
    DateTime date = dateTime;
    String dow = DateFormat('EEEE').format(date);
    if(dow == "Saturday" || dow == "Sunday"){
      return false;
    }

    TimeOfDay timeNow = timeN;
    int nowMTime =  timeNow.hour * 60 + timeNow.minute;

    if(this.startTime.length < 6){
      String openHour = this.startTime.substring(0,2);
      String openMin = this.startTime.substring(3,5);
      TimeOfDay openTime = TimeOfDay(hour: int.parse(openHour), minute: int.parse(openMin));
      String closeHour = this.endTime.substring(0,2);
      String closeMin = this.endTime.substring(3,5);
      TimeOfDay closeTime = TimeOfDay(hour: int.parse(closeHour), minute: int.parse(closeMin));
      int openMTime = openTime.hour * 60 + openTime.minute;
      int closeMTime = closeTime.hour * 60 + closeTime.minute;


      if(nowMTime >= openMTime && nowMTime <= closeMTime){
        return true;
      }
      else {
        return false;
      }
    }
    else{
      String openHour = this.startTime.substring(0,2);
      String openMin = this.startTime.substring(3,5);
      TimeOfDay openTime = TimeOfDay(hour: int.parse(openHour), minute: int.parse(openMin));
      String closeHour = this.startTime.substring(6,8);
      String closeMin = this.startTime.substring(9,10);
      TimeOfDay closeTime = TimeOfDay(hour: int.parse(closeHour), minute: int.parse(closeMin));
      int openMTime = openTime.hour * 60 + openTime.minute;
      int closeMTime = closeTime.hour * 60 + closeTime.minute;

      if(nowMTime >= openMTime && nowMTime <= closeMTime){
        return true;
      }

      String openHour2 = this.endTime.substring(0,2);
      String openMin2 = this.endTime.substring(3,5);
      TimeOfDay openTime2 = TimeOfDay(hour: int.parse(openHour2), minute: int.parse(openMin2));
      String closeHour2 = this.endTime.substring(6,8);
      String closeMin2 = this.endTime.substring(9,10);
      TimeOfDay closeTime2 = TimeOfDay(hour: int.parse(closeHour2), minute: int.parse(closeMin2));
      int openMTime2 = openTime2.hour * 60 + openTime2.minute;
      int closeMTime2 = closeTime2.hour * 60 + closeTime2.minute;

      if(nowMTime >= openMTime2 && nowMTime <= closeMTime2){
        return true;
      }
    }




    return false;
  }

}