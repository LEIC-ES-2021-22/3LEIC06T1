import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static const String local_storare_key = 'notifications';


  NotificationService(){
    reminderNotifications = FlutterLocalNotificationsPlugin();
    _setupNotifications();
    notifications = [];
    _load_locastorage_notifications();
    idCounter = 0;
  }

  Future<void> _load_locastorage_notifications() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stored_notifications = prefs.getStringList(local_storare_key);
    //_save_localstorage();
    if (stored_notifications != null){
      for (var i = 0; i < stored_notifications.length ; i++){

        NotificationData saved_notif = NotificationData.parseString(stored_notifications[i]);

        if (saved_notif != null){
          notifications.add(saved_notif);
        }
      }
    }

    num stored_idCounter = prefs.getInt('notification_counter');
    if (stored_idCounter != null){
      idCounter = stored_idCounter;
    }

  }

  Future<void> _save_localstorage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notifications_tostring = [];
    //print("before the for in _save_localstorage");
    for(var i = 0; i < notifications.length; i++){
      notifications_tostring.add(
          notifications[i].toString()
      );
    }
    //print("after the for in _save_localstorage");

    prefs.setStringList(local_storare_key, notifications_tostring);
    prefs.setInt('notification_counter', idCounter);
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
    final androidInit = AndroidInitializationSettings('@drawable/ic_notification');
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
        color: Color.fromARGB(255, 0x75, 0x17, 0x1e)

    );
    final iOSDetails = IOSNotificationDetails();
    NotificationDetails(android: androidDetails,
        iOS: iOSDetails
    );

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

    _save_localstorage();


    //_writeJson();
  }

  Future deleteNotification(num notificationID) async{
    for (int x = 0; x < notifications.length; x++){
      if (notifications[x].id == notificationID){
        notifications.removeAt(x);
      }
    }
    await reminderNotifications.cancel(notificationID);

    _save_localstorage();


  }

  Future deleteAllNotification() async{
    notifications = [];
    await reminderNotifications.cancelAll();

    _save_localstorage();
  }


  List<NotificationData> getPendingNotifications(){
    final pendingNotifications = notifications;
    return pendingNotifications;
  }

  Future editNotification(num notificationID, DateTime notifSchedule) async{
    final List<NotificationData> pendingNotificationRequests = await
        getPendingNotifications();

    for(var notif in pendingNotificationRequests){
      if (notif.id == notificationID){
        final title = notif.title;
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
        notifications.add(NotificationData(id: idCounter, title: title, body: schedule.toString()));
        idCounter += 1;

        _save_localstorage();

        //_writeJson();
        return;
      }
    }
  }



}