import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uni/controller/reminder_controller.dart';
import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/row_container.dart';
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

  State<StatefulWidget> createState() => ServiceDescState();

}

class ServiceDescState extends State<ServiceDesc>{
  DateTime selectedSchedule;

  createNotification(){
    setState(() {
      Provider.of<NotificationService>(context, listen: false)
          .addNotification(selectedSchedule, widget.myService);
    });
  }

  make_reminder_menu(context) {
    ReminderUI reminderUI = ReminderUI(dateTime: DateTime.now());
    Alert(
        context: context,
        title: '',
        content: reminderUI,
        buttons: [
          DialogButton(
            onPressed: () {
              selectedSchedule = reminderUI.getInputDateTime();
              createNotification();
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






