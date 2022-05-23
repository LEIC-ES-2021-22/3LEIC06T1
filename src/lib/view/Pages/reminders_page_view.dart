import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import '../../controller/reminder_controller.dart';
import '../../model/app_state.dart';
import '../../model/entities/reminder.dart';
import '../Widgets/reminder_UI.dart';
import '../Widgets/row_container.dart';
import 'package:uni/utils/reminderMock.dart';

import 'edit_reminders_view.dart';


class RemindersPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RemindersPageViewState();
}

class RemindersPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
      },
      builder: (context, reminders) {
        return RemindersList();
      },
    );
  }
}

class RemindersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReminderListState();


}

class ReminderListState extends State<RemindersList>{
  List<CustomNotification> pendingReminders;
  num notificationID;
  DateTime newSelectedSchedule;

  getNotifications(){
    setState(() {
      pendingReminders = Provider.of<NotificationService>(context, listen: false)
          .getPendingNotifications();
    });
  }

  editNotification(){
    setState(() {
      Provider.of<NotificationService>(context, listen: false)
          .editNotification(notificationID, newSelectedSchedule);
    });
  }

  edit_reminder_menu(context, notif_id) {
    ReminderUI reminderUI = ReminderUI(dateTime: DateTime.now());
    Alert(
        context: context,
        title: '',
        content: reminderUI,
        buttons: [
          DialogButton(
            onPressed: () {
              newSelectedSchedule = reminderUI.getInputDateTime();
              notificationID = notif_id;
              editNotification();
              //Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RemindersPageView()),
              );
              //reload reminders_page_view
            },
            child: Text(
              "Update",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  this.createRemindersListCard(context),
                ],
              )
          ),
        ]
    );
  }

  Widget createRemindersListCard(context) {
    final keyValue = 'reminders';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.createRemindersList(context),
        ],
      ),

    );
  }

  Widget createRemindersList(context) {
    final keyValue = 'desc';
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RowContainer(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height:20),
                Center(child:
                Text('Reminders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                )
                ),
                const SizedBox(height:20),
                createReminderCards(context)
              ]
          ),
        )
    );
  }

  Widget createReminderCards(context) {
    final List<Widget> reminderCards = <Widget>[];
    getNotifications();
    for (int i = 0; i < pendingReminders.length; i++) {
      reminderCards.add(this.createReminderCard(context, pendingReminders[i]));
    }
    return Column(children: reminderCards);
  }

  Widget createReminderCard(context, reminder) {
    final keyValue = '${reminder.id}-reminder';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.createReminder(context, reminder),
        ],
      ),

    );
  }


  Widget createReminder(context, reminder) {
    final keyValue = '${reminder.id}-reminder';
    return GestureDetector(
            onTap: () {
              edit_reminder_menu(context, reminder.id);
            },
    child:
      Container(
          key: Key(keyValue),
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
              Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height:10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text(reminder.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                            )
                        )
                    ),
                    const SizedBox(height:10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text(reminder.body.substring(0,16),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize:12,
                            )
                        )
                    ),
                    const SizedBox(height:10),
                  ]
              ),
              FloatingActionButton.small(
                backgroundColor: Colors.white,
                onPressed: () {
                },
                child: Icon(
                  Icons.delete  ,
                  size: 25,
                  color: Colors.black,
                ),
              ),

            ],
          )
      )
    );
  }
}