import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'analog_clock.dart';

make_reminder_menu(context,reminder) {
  Alert(
      context: context,
      title: '',
      content: Column(
        children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )
                ),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {
                      },
                      child: Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text(reminder.date.split(' ')[0],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                            )
                        )
                    ),
                  ],
                  )
            ),
          const SizedBox(height:30),
          ClockDemo(myHour: reminder.date),
          const SizedBox(height:20),
          Text(reminder.date.split(' ')[1],
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize:20,
              )
          )
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Edit",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
            ),
        )
        ]).show();
}