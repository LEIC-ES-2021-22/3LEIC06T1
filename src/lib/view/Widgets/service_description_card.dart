import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/row_container.dart';

Widget createServiceDescCard(context, service) {
  final keyValue = '${service.toString()}-desccard';
  return Container(
    key: Key(keyValue),
    margin: EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        createServiceDesc(context, service),
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
    child: createServiceSchedule(context, service),
  );
}

Widget createServiceTitleCard(context, service) {
  final keyValue = '${service.toString()}-titlecard';
  return Container(
    key: Key(keyValue),
    margin: EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.all(8),
    child: createServiceTitle(context, service),
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
        ),
        )
    ),
  );
}

Widget createServiceIsOpen(context, service) {
  final keyValue = '${service.toString()}-isOpen';
  return Container(
      key: Key(keyValue),
      height: 80,
      margin: EdgeInsets.fromLTRB(80, 4, 80, 0),
      child: RowContainer(
        color: Theme
            .of(context)
            .backgroundColor,
        child:
        Center(child:
        Text((() {
          if (service.isOpen(TimeOfDay.now(), DateTime.now())) {
            return "Opened";
          }
          return "Closed";
        })(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .accentColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
          )
        ),
      )
  );
}