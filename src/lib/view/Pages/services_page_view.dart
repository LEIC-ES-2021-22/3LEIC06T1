import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/service.dart';
import 'package:uni/utils/serviceMock.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/service_description_view.dart';
import 'package:uni/view/Widgets/Service_page_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';

import '../Widgets/services_card.dart';

import '../Widgets/form_text_field.dart';


class ServicePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SericesPageViewState();
}

/// Tracks the state of `ServicesLists`.
class SericesPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;
  static final list = ServiceMock.getServices();
  static final _formKey =  GlobalKey<FormState>();

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {return List<dynamic>(0);},
      builder: (context, services) {
        return ServiceList( services: list);
      },
    );
  }
}

/// Manages the 'Service' section in the user's personal area and 'Exams Map'.
class ServiceList extends StatefulWidget {
  final List<Service> services;



  ServiceList({ @required this.services}) ;

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  static final TextEditingController searchController =
  TextEditingController();

  static final scrollController = ScrollController();

  static final _formKey1 =  GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return


              ListView(
                key: _formKey1,
                shrinkWrap: true,
                controller: scrollController,
                children:
                this.createServiceColumn(context, widget.services),

    );
  }

  List<Widget> createServiceColumn(context, services) {
    final List<Widget> columns = <Widget>[];
    columns.add(ServicePageTitleFilter(
      name: 'Serviços',
    ));
    columns.add(createSearchBar(context, services));


    columns.add(this.createServiceCard(context, services));
    return columns;
  }

  Widget createSearchBar(context,services){


    return IconButton(onPressed: () {
      showSearch(context: context, delegate: CustomSearchDelegate());
    }, icon: const Icon(Icons.search));
  }

  Widget createServiceCard(context, services) {
    final keyValue1 = services.map((service) => service.toString()).join();
    return Container(
      key: Key(keyValue1),
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
    return ListView(shrinkWrap: true, children: serviceCards,controller: scrollController,);
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
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = ServiceMock.getNames();



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTerms){
      if(word.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(word);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTerms){
      if(word.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(word);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result ),onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServiceDescriptionPage(myService: ServiceMock.getService(result))),
            );
          },);
        });
  }

}

