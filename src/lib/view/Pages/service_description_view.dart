import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uni/controller/reminder_controller.dart';
import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:timezone/timezone.dart' as tz;
import '../Widgets/reminder_UI.dart';
import '../Widgets/service_description_card.dart';

class ServiceDescriptionPage extends StatefulWidget {
  final Service myService;

  ServiceDescriptionPage({
    this.myService
  });
  @override
  State<StatefulWidget> createState() => ServiceDescPageViewState(service: this.myService);
}

class ServiceDescPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;
  final Service service;

  ServiceDescPageViewState({Key key, @required this.service});

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
      },
      builder: (context, services) {
        return ServiceDesc( myService: this.service);
      },
    );
  }
}

class ServiceDesc extends StatefulWidget {
  final Service myService;
  final double borderRadius = 10.0;

  ServiceDesc({Key key, @required this.myService});

  State<StatefulWidget> createState() => ServiceDescState(myService);

}

class ServiceDescState extends State<ServiceDesc>{
  DateTime selectedSchedule;
  final Service service;

  ServiceDescState(this.service);

  createNotification(){
    setState(() {
      Provider.of<NotificationService>(context, listen: false)
          .addNotification(selectedSchedule.toLocal(), widget.myService);

    });
  }

  Event createExamEvent() {

    final List<String> partsBegin = selectedSchedule.toString().split(' ');
    final List<String> time = partsBegin[1].split(':');
    final int myHours = int.parse(time[0]);
    final int myMinutes = int.parse(time[1]);
    return Event(
      title: service.name,
      location: '',
      startDate: DateTime(
          int.parse(partsBegin[0].split('-')[0]),
          int.parse(partsBegin[0].split('-')[1]),
          int.parse(partsBegin[0].split('-')[2]),
          myHours,
          myMinutes
      ),
      endDate: DateTime(
          int.parse(partsBegin[0].split('-')[0]),
          int.parse(partsBegin[0].split('-')[1]),
          int.parse(partsBegin[0].split('-')[2]),
          myHours,
          myMinutes
      ),

    );
  }

  make_reminder_menu(context) {
    ReminderUI reminderUI = ReminderUI(dateTime: DateTime.now().toLocal());
    Alert(
        context: context,
        title: '',
        content:
          Column(
            children: <Widget>[
              reminderUI,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                FloatingActionButton(
                  key: Key('key_upload_to_calendar'),
                  backgroundColor: Colors.white,
                      onPressed: (){
                        selectedSchedule = reminderUI.getInputDateTime().toLocal();
                        Add2Calendar.addEvent2Cal(this.createExamEvent());
                        },
                      child: Icon(
                      Icons.upload_rounded ,
                      size: 30,
                      color: Colors.black,
                      ),
                  ),
                  FloatingActionButton(
                    key: Key('key_create_reminder'),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      selectedSchedule = reminderUI.getInputDateTime().toLocal();
                      createNotification();
                      Navigator.pop(context);
                    },
                    child: Icon(
                    Icons.library_add_check_outlined ,
                    size: 30,
                    color: Colors.black,
                    ),
                ),
              ]
            ),
            ],
          ),
        buttons: [
        ]).show();
  }

  @override
  Widget build(BuildContext context){
    return ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  createServiceTitleCard(context, widget.myService),
                  createServiceScheduleCard(context, widget.myService),
                  createServiceDescCard(context, widget.myService),
                  createServiceIsOpen(context, widget.myService),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    FloatingActionButton(

                      heroTag: "locationButton",
                      backgroundColor: Colors.white,
                      onPressed: () {

                      },
                      child: Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    FloatingActionButton(
                      key: Key('key_create_reminder_window'),
                      heroTag: "makeReminderButton",
                      backgroundColor: Colors.white,
                      onPressed: () => make_reminder_menu(context),
                      child: Icon(
                        Icons.calendar_month,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                   ],
                  ),
                ],
              )
          ),
        ]
    );
  }
}






