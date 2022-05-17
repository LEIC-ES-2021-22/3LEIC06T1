
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin reminderNotifications;
  num id_counter;
  NotificationDetails generalNotificationDetails;


  NotificationService(){
    var androidInit = new AndroidInitializationSettings('icon');
    var iOSInit = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: androidInit, iOS: iOSInit);
    reminderNotifications.initialize(initSettings,
        onSelectNotification: onSelectNotification);

    var androidDetails = new AndroidNotificationDetails("Reminder ID",
        "Reminders");
    var iOSDetails = new IOSNotificationDetails();
    generalNotificationDetails = new NotificationDetails(android: androidDetails,iOS: iOSDetails);

    id_counter = 0;
  }

  Future onSelectNotification(String payload) async{
    //do nothing
  }

  Future addNotification(DateTime notifSchedule, Service service) async{

    var scheduledTime = notifSchedule;
    await reminderNotifications.zonedSchedule(id_counter, "Nome-Serviço", "dia e hora", scheduledTime, generalNotificationDetails);

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
        await reminderNotifications.zonedSchedule(id_counter, title, body, notifSchedule, generalNotificationDetails);
        return;
      }
    }
  }



}