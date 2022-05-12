import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/utils/serviceMock.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/service_description_view.dart';
import 'package:uni/view/Widgets/Service_page_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';


class ServicePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SericesPageViewState();
}

/// Tracks the state of `ServicesLists`.
class SericesPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {


      },
      builder: (context, services) {
        return ServiceList( services: ServiceMock.getServices());
      },
    );
  }
}

/// Manages the 'Service' section in the user's personal area and 'Exams Map'.
class ServiceList extends StatelessWidget {
  final List<Service> services;

  ServiceList({Key key, @required this.services}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.createServiceColumn(context, services)
          ),
        )
      ],
    );
  }

  List<Widget> createServiceColumn(context, services) {
    final List<Widget> columns = <Widget>[];
    columns.add(ServicePageTitleFilter(
      name: 'Serviços',
    ));


    columns.add(this.createServiceCard(context, services));
    return columns;
  }

  Widget createServiceCard(context, services) {
    final keyValue = services.map((service) => service.toString()).join();
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: this.createServicesCards(context, services),
    );
  }

  Widget createServicesCards(context, services) {
    final List<Widget> serviceCards = <Widget>[];
    for (int i = 0; i < services.length; i++) {
      serviceCards.add(this.createServiceContext(context, services[i]));
    }
    return Column(children: serviceCards);
  }

  Widget createServiceContext(context, service) {
    final keyValue = '${service.name}-service';
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceDescPageView(myService:service)),
          );
      },
      child: Container(
        key: Key(keyValue),
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
}



