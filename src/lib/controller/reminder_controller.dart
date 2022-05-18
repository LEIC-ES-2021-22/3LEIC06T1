import 'dart:developer';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin reminderNotifications;
  num idCounter;
  NotificationDetails generalNotificationDetails;


  NotificationService(){
    _setupNotifications();
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

  _initializeNotifications (){
    final androidInit = AndroidInitializationSettings('icon');
    final iOSInit = IOSInitializationSettings();
    final initSettings = InitializationSettings(
        android: androidInit,
        iOS: iOSInit
    );
    reminderNotifications.initialize(
        initSettings,
        onSelectNotification: _onSelectNotification
    );

    final androidDetails = AndroidNotificationDetails(
      'Reminder ID',
      'Reminders',
      channelDescription: "Reminder notification",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
    final iOSDetails = IOSNotificationDetails();
    generalNotificationDetails = NotificationDetails(android: androidDetails,
        iOS: iOSDetails);
  }



  Future _onSelectNotification(String payload) async{
    //if(payload != null && payload.isNotEmpty){
    //
    //}
  }

  checkForNotifications() async{
    final details = await reminderNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp){
      _onSelectNotification(details.payload);
    }
  }

  Future addNotification(DateTime notifSchedule, Service service) async{

    await reminderNotifications.zonedSchedule(idCounter,
        'Nome-Serviço',
        'dia e hora',
        tz.TZDateTime.from(notifSchedule, tz.local), generalNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );

    idCounter += 1;
  }

  Future deleteNotification(num notificationID) async{
    await reminderNotifications.cancel(notificationID);
  }

  Future deleteAllNotification() async{
    await reminderNotifications.cancelAll();
  }

  Future editNotification(num notificationID, DateTime notifSchedule) async{
    final List<PendingNotificationRequest> pendingNotificationRequests =
    await reminderNotifications.pendingNotificationRequests();

    for(var notif in pendingNotificationRequests){
      if (notif.id == notificationID){
        var title = notif.title;
        var body = notif.body;

        deleteNotification(notificationID);
        await reminderNotifications.zonedSchedule(idCounter, title, body, notifSchedule, generalNotificationDetails);
        idCounter += 1;
        return;
      }
    }
  }



}