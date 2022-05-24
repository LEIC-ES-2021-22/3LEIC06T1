import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import '../../model/app_state.dart';
import '../../model/entities/reminder.dart';
import '../Widgets/row_container.dart';
import 'package:uni/utils/reminderMock.dart';


class EditRemindersPageView extends StatefulWidget {
  final Reminder myReminder;
  EditRemindersPageView({
    this.myReminder
  });
  @override
  State<StatefulWidget> createState() => EditRemindersPageViewState(reminder: myReminder);
}


class EditRemindersPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;
  final Reminder reminder;

  EditRemindersPageViewState({Key key, @required this.reminder});

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
      },
      builder: (context, reminder) {
        return RemindersList(reminder: this.reminder);
      },
    );
  }
}

class RemindersList extends StatelessWidget {
  final Reminder reminder;

  RemindersList({Key key, @required this.reminder}) : super(key: key);
  @override
  Widget build(BuildContext context,) {
    return ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  this.createRemindersListCard(context, reminder),
                ],
              )
          ),
        ]
    );
  }

  Widget createRemindersListCard(context, reminder) {
    final keyValue = '${reminder.toString()}-reminders';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.createRemindersList(context, reminder),
        ],
      ),
    );
  }

  Widget createCalenderCard(context, reminder) {
    final keyValue = '${reminder.toString()}-reminder';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          this.createCalender(context, reminder),
        ],
      ),

    );
  }

  Widget createCalender(context, reminder) {
    final keyValue = '${reminder.toString()}-reminder';
    return Container(
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
                    Text(reminder.serviceName,
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
        );
  }

  Widget createRemindersList(context, reminder) {
    final keyValue = '${reminder.toString()}-desc';
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RowContainer(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20),
                Center(child:
                Text('Reminders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                )
                ),
                const SizedBox(height: 20),
                createCalenderCard(context, reminder),
              ]
          ),
        )
    );
  }


}

