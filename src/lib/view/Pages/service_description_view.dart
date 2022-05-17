import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/row_container.dart';

import 'package:uni/view/Widgets/make_reminder_menu.dart';

class ServiceDescPageView extends StatefulWidget {
  final Service myService;
  ServiceDescPageView({
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
        return ServiceDesc( service: this.service);
      },
    );
  }
}

class ServiceDesc extends StatelessWidget {
  final Service service;

  ServiceDesc({Key key, @required this.service});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                  FloatingActionButton(
                    backgroundColor:Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ServiceDescPageView(myService:service)),
                      );
                    },
                    child: Icon(
                      Icons.house_outlined ,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
                ),*/
                this.createServiceTitleCard(context, service),
                this.createServiceScheduleCard(context, service),
                this.createServiceDescCard(context, service),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    FloatingActionButton(
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

  Widget createServiceDescCard(context, service) {
    final keyValue = '${service.toString()}-desccard';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          this.createServiceDesc(context, service),
        ],
      ),

    );
  }

  Widget createServiceScheduleCard(context, service) {
    final keyValue = '${service.toString()}-schedulecard';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: this.createServiceSchedule(context, service),
    );
  }

  Widget createServiceTitleCard(context, service) {
    final keyValue = '${service.toString()}-titlecard';
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: this.createServiceTitle(context, service),
    );
  }

  Widget createServiceDesc(context, service) {
    final keyValue = '${service.toString()}-desc';
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RowContainer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height:20),

                Center(child:
                    Text('Description',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )
                    )
                  ),
                const SizedBox(height:20),
                Center(child:
                Text(service.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17  ,
                    )
                  )
                ),
                const SizedBox(height:20),

              ]
          ),
        )
    );
  }

  Widget createServiceSchedule(context, service) {
    final keyValue = '${service.toString()}-schedule';
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RowContainer(

            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height:20),
                  Center(child:
                  Text('Schedule',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                    )
                ),
                const SizedBox(height:20),
                Center(child:
                      Text(service.startTime,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )
                      )
                    ),
                  Center(child:
                    Text(service.endTime,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )
                    )
                  ),
                  const SizedBox(height:20),

                ]
          )
        )
    );
  }

  Widget createServiceTitle(context, service) {
    final keyValue = '${service.toString()}-title';
    return Container(
        key: Key(keyValue),
        height: 80,
        margin: EdgeInsets.fromLTRB(80, 4, 80, 0),
        child: RowContainer(
            color: Theme.of(context).backgroundColor,
            child:
              Center(child:
                Text(service.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  )
                )
              ),
        )
    );
  }
}



