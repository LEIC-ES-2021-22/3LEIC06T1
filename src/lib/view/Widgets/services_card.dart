
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';

import '../Pages/service_description_view.dart';
import 'Service_page_filter.dart';

List<Widget> createServiceColumn(context, services) {
  final List<Widget> columns = <Widget>[];
  columns.add(ServicePageTitleFilter(
    name: 'Serviços',
  ));
  columns.add(createServiceCard(context, services));
  return columns;
}

Widget createServiceCard(context, services) {
  final keyValue = services.map((service) => service.toString()).join();
  return Container(
    key: Key(keyValue),
    margin: EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.all(8),
    child: createServicesCards(context, services),
  );
}

Widget createServicesCards(context, services) {
  final List<Widget> serviceCards = <Widget>[];
  for (int i = 0; i < services.length; i++) {
    serviceCards.add(createServiceContext(context, services[i]));
  }
  return Column(children: serviceCards);
}

Widget createServiceContext(context, service) {
  final keyValue = '${service.name}-service';
  return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceDescriptionPage(myService:service)),
        );
      },
      child: Container(
          key: Key(keyValue),//
          margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: RowContainer(
              color: Theme.of(context).backgroundColor,
              child: ScheduleRow(
                  subject: service.name,
                  rooms: [''],
                  begin: service.startTime,
                  end: service.endTime
              )
          )
      )
  );
}