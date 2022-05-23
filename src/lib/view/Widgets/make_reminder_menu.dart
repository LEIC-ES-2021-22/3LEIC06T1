import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uni/view/Widgets/reminder_UI.dart';



make_reminder_menu(context,reminder) {
  DateTime dateTime;
  Alert(
      context: context,
      title: '',
      content: buildReminderUI(context, dateTime),
      buttons: [
          DialogButton(
            onPressed: () {

              Navigator.pop(context);
            },
            child: Text(
              "Create",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
          )
        ]).show();
}