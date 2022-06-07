import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/utils/serviceMock.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../Widgets/services_card.dart';


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
            children: createServiceColumn(context, services)
          ),
        )
      ],
    );
  }

}



