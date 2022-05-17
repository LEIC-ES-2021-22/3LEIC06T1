import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import '../../model/app_state.dart';
import '../../model/entities/reminder.dart';
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
        return RemindersList(reminders: ReminderMock.getReminders());
      },
    );
  }
}

class RemindersList extends StatelessWidget {
  final List<Reminder> reminders;

  RemindersList({Key key, @required this.reminders}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  this.createRemindersListCard(context,reminders),
                ],
              )
          ),
        ]
    );
  }

  Widget createRemindersListCard(context, reminders) {
    final keyValue = '${reminders.toString()}-reminders';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.createRemindersList(context, reminders),
        ],
      ),

    );
  }

  Widget createReminderCard(context, reminder) {
    final keyValue = '${reminder.toString()}-reminder';
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
  Widget createRemindersList(context, reminders) {
    final keyValue = '${reminders.toString()}-desc';
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
                createReminderCards(context,reminders)
              ]
          ),
        )
    );
  }
  Widget createReminderCards(context, reminders) {
    final List<Widget> reminderCards = <Widget>[];
    for (int i = 0; i < reminders.length; i++) {
      reminderCards.add(this.createReminderCard(context, reminders[i]));
    }
    return Column(children: reminderCards);
  }
  Widget createReminder(context, reminder) {
    final keyValue = '${reminder.toString()}-reminder';
    return GestureDetector(
            onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditRemindersPageView(myReminder: reminder)),
              );
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
                        Text(reminder.serviceName,
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
                        Text(reminder.date,
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