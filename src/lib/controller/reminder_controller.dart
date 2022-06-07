import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'dart:io';
import 'package:uni/model/entities/service.dart';

import '../model/entities/notification_data.dart';


class NotificationService {
  FlutterLocalNotificationsPlugin reminderNotifications;
  num idCounter;
  List<NotificationData> notifications;
  static const String jsonFile = 'notifications.json';

  toJson(){
    var map = {};
    notifications.forEach((notif) =>
    map[notif.id.toString()] = notif.toJson());
    return map;
  }

  Future<void> fromJson() async {
    final path = await _localPath;
    final String response = await rootBundle.loadString('$path/$jsonFile');
    final data = await json.decode(response);
    data.forEach((key, value){
      notifications.add(NotificationData.fromJson(value));
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$jsonFile');
  }

  void _writeJson() async {
    final _filePath = await _localFile;

    Map<String, dynamic> _newJson = toJson();
    print('1.(_writeJson) _newJson: $_newJson');


    String jsonString = jsonEncode(_newJson);

    await _filePath.writeAsString(jsonString);
  }




  NotificationService(){
    reminderNotifications = FlutterLocalNotificationsPlugin();
    _setupNotifications();
    notifications = [];
    fromJson();
    idCounter = 0;
  }

  _setupNotifications() async{
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async{
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  _initializeNotifications() async{
    final androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOSInit = IOSInitializationSettings();
    final initSettings = InitializationSettings(
        android: androidInit,
        iOS: iOSInit
    );
    await reminderNotifications.initialize(
        initSettings,
        onSelectNotification: _onSelectNotification
    );

  }

  Future _onSelectNotification(String payload) async{
    deleteNotification(int.parse(payload));
    if(payload != null && payload.isNotEmpty){
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ServiceDescPageView('/' + payload)),
      );*/
    }
  }

  checkForNotifications() async{
    final details = await reminderNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp){
      _onSelectNotification(details.payload);
    }
  }




  Future addNotification(DateTime notifSchedule, Service service) async{
    final androidDetails = AndroidNotificationDetails(
      'Reminder ID',
      'Reminders',
      channelDescription: "Reminders' notification",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
    final iOSDetails = IOSNotificationDetails();
    NotificationDetails(android: androidDetails,
        iOS: iOSDetails);

    DateTime schedule = tz.TZDateTime.from(notifSchedule, tz.local);

    await reminderNotifications.zonedSchedule(
        idCounter,
        service.name,
        schedule.toString(),
        schedule,
        NotificationDetails(
            android: androidDetails,
            iOS: iOSDetails
        ),
        payload: idCounter.toString(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );

    notifications.add(NotificationData(
        id: idCounter,
        title: service.name,
        body: schedule.toString()
      )
    );

    idCounter += 1;

    _writeJson();
  }

  Future deleteNotification(num notificationID) async{
    for (int x = 0; x < notifications.length; x++){
      if (notifications[x].id == notificationID){
        notifications.removeAt(x);
      }
    }
    await reminderNotifications.cancel(notificationID);

    _writeJson();
  }

  Future deleteAllNotification() async{
    notifications = [];
    await reminderNotifications.cancelAll();
    _writeJson();
  }

  List<NotificationData> getPendingNotifications(){
    return notifications;
  }

  Future editNotification(num notificationID, DateTime notifSchedule) async{
    final List<NotificationData> pendingNotificationRequests =
        getPendingNotifications();

    for(var notif in pendingNotificationRequests){
      if (notif.id == notificationID){
        final title = notif.title;
        final body = notif.body;

        deleteNotification(notificationID);
        //create new notif with the same text
        final androidDetails = AndroidNotificationDetails(
          'Reminder ID',
          'Reminders',
          channelDescription: "Reminders' notification",
          importance: Importance.max,
          priority: Priority.max,
          enableVibration: true,
        );
        final iOSDetails = IOSNotificationDetails();
        NotificationDetails(android: androidDetails,
            iOS: iOSDetails);

        DateTime schedule = tz.TZDateTime.from(notifSchedule, tz.local);

        await reminderNotifications.zonedSchedule(
          idCounter,
          title,
          schedule.toString(),
          schedule,
          NotificationDetails(
              android: androidDetails,
              iOS: iOSDetails
          ),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
        );
        notifications.add(NotificationData(id: idCounter, title: title, body: schedule.toLocal().toString()));
        idCounter += 1;

        _writeJson();
        return;
      }
    }
  }



}