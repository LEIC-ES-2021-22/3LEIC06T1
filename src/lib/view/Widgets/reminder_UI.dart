import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../model/entities/reminder.dart';
import 'analog_clock.dart';

class ReminderUI extends StatefulWidget{
  final DateTime dateTime;
  DateTime inputDateTime;

  getInputDateTime(){
    return inputDateTime;
  }

  ReminderUI({
    this.dateTime
  });

  @override
  State<StatefulWidget> createState() => ReminderUIState(this.dateTime);

}

class ReminderUIState extends State<ReminderUI>{
  DateTime initDateTime;
  DateTime calendarDateTime;
  DateTime clockDateTime;

  ReminderUIState(DateTime initDateTime){
    this.initDateTime = initDateTime;
    calendarDateTime = initDateTime;
    clockDateTime = initDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2025, 12, 7),
                        theme: DatePickerTheme(
                            headerColor: Colors.lightBlueAccent,
                            backgroundColor: Colors.white,
                            itemStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                        onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        },
                        onConfirm: (date) {
                          calendarDateTime = date;
                          print('confirm $calendarDateTime');
                        },
                        currentTime: initDateTime,
                        locale: LocaleType.pt);
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
                          color: Theme
                              .of(context)
                              .accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    )
                ),
              ],
            )
        ),
        const SizedBox(height: 30),
        ClockDemo(initDateTime),
        const SizedBox(height: 20),
        Text(reminder.date.split(' ')[1],
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}