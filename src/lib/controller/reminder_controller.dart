import 'dart:developer';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin reminderNotifications;
  num idCounter;
  NotificationDetails generalNotificationDetails;


  NotificationService(){
    final androidInit = AndroidInitializationSettings('icon');
    final iOSInit = IOSInitializationSettings();
    final initSettings = InitializationSettings(android: androidInit,
                                              iOS: iOSInit);
    reminderNotifications.initialize(initSettings,
        onSelectNotification: onSelectNotification);

    final androidDetails = AndroidNotificationDetails('Reminder ID',
                                                      'Reminders');
    final iOSDetails = IOSNotificationDetails();
    generalNotificationDetails = NotificationDetails(android: androidDetails,
                                                     iOS: iOSDetails);
    _setupTimezone();
    idCounter = 0;
  }

  Future _setupTimezone() async{
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  Future onSelectNotification(String payload) async{
    //do nothing
  }

  Future addNotification(DateTime notifSchedule, Service service) async{

    await reminderNotifications.zonedSchedule(idCounter, "Nome-Serviço",
        "dia e hora", tz.TZDateTime.from(notifSchedule, tz.local), generalNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
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