import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:uni/model/entities/service.dart';

class CustomNotification{
  num id;
  String title;
  String body;

  CustomNotification(num id, String title, String body){
    this.id = id;
    this.title = title;
    this.body = body;
  }
}

class NotificationService {
  FlutterLocalNotificationsPlugin reminderNotifications;
  num idCounter;
  List<CustomNotification> notifications;


  NotificationService(){
    reminderNotifications = FlutterLocalNotificationsPlugin();
    _setupNotifications();
    notifications = [];
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
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );

    notifications.add(CustomNotification(
        idCounter,
        service.name,
        schedule.toString()
      )
    );

    idCounter += 1;
  }

  Future deleteNotification(num notificationID) async{
    for (int x = 0; x < notifications.length; x++){
      if (notifications[x].id == notificationID){
        notifications.removeAt(x);
      }
    }
    await reminderNotifications.cancel(notificationID);
  }

  Future deleteAllNotification() async{
    notifications = [];
    await reminderNotifications.cancelAll();
  }

  List<CustomNotification> getPendingNotifications(){
    return notifications;
  }

  Future editNotification(num notificationID, DateTime notifSchedule) async{
    final List<CustomNotification> pendingNotificationRequests =
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

        await reminderNotifications.zonedSchedule(
          idCounter,
          title,
          body,
          notifSchedule,
          NotificationDetails(
              android: androidDetails,
              iOS: iOSDetails
          ),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
        );
        idCounter += 1;

        return;
      }
    }
  }



}