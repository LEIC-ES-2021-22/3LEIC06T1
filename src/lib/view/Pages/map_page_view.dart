import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/service_description_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uni/model/entities/service.dart';

import '../../utils/serviceMock.dart';
import '../Widgets/row_container.dart';
import '../Widgets/schedule_row.dart';

class MapPageView extends StatefulWidget {
  String service;

  MapPageView(String service) {
    this.service = service;
  }


  @override
  State<StatefulWidget> createState() => AboutPageViewState(this.service);
}

/// Manages the 'about' section of the app.
class AboutPageViewState extends GeneralPageViewState {
  String service;

  AboutPageViewState(String service) {
    this.service = service;
  }

  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Mapa")),
          backgroundColor: Colors.cyan,
        ),
        body: MapSample(this.service),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  String service;

  MapSample(String service) {
    this.service = service;
  }

  @override
  State<MapSample> createState() => MapSampleState(this.service);
}

class MapSampleState extends State<MapSample> {
  static final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor currentPosIcon;
  static final Map<String, LatLng> services = HashMap();
  static final Map<String, String> servicesInfo = HashMap();
  List<Service> serviceList;
  static final _formKey2 =  GlobalKey<FormState>();

  String service;

  MapSampleState(String service) {
    this.service = service;
  }


  void addService(String name, LatLng location, String beginTime, String endTime) {
    _markers.add(Marker(
      markerId: MarkerId(name),
      infoWindow: InfoWindow(title: name, snippet: beginTime + "  " + endTime),
      position: location,
    ));
  }

  @override
  void initState() {
    services.addAll({"SDInf": LatLng(41.17746504425501, -8.594736036826815), "SERAC": LatLng(41.178026372500376, -8.597829247433044), "SICC": LatLng(41.17781754970367, -8.595047200753985), "SRH": LatLng(41.17813855720173, -8.597663632785746), "SEF": LatLng(41.17823949752264, -8.597561708852806), "STMA": LatLng(41.17772584745011, -8.596755364495348) });
    serviceList = ServiceMock.getServices();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      for (int i = 0; i < services.length; i++) {
        addService(serviceList[i].name, services[serviceList[i].name], serviceList[i].startTime, serviceList[i].endTime);
      }
    });
    _goToMarker();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.17817607238003, -8.596451894896566),
    zoom: 17.0,
    bearing: 90.0,
  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId("_kGooglePlex"),
    infoWindow: InfoWindow(title: "Test Window"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.17817607238003, -8.596451894896566),
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  CameraPosition initialPosition() {
    switch(this.service) {
      case "SERAC":
        return CameraPosition(
          target: LatLng(41.178026372500376, -8.597829247433044),
          zoom: 17.0,
          bearing: 90.0,
        );
      case "SDInf":
        return CameraPosition(
        target: LatLng(41.17746504425501, -8.594736036826815),
        zoom: 17.0,
        bearing: 90.0);
      case "SICC":
        return CameraPosition(
        target: LatLng(41.17781754970367, -8.595047200753985),
        zoom: 17.0,
        bearing: 90.0);
      case "SRH":
        return CameraPosition(
        target: LatLng(41.17813855720173, -8.597663632785746),
        zoom: 17.0,
        bearing: 90.0);
      case "SEF":
        return CameraPosition(
        target: LatLng(41.17823949752264, -8.597561708852806),
        zoom: 17.0,
        bearing: 90.0);
      case "STMA":
        return CameraPosition(
        target: LatLng(41.17772584745011, -8.596755364495348),
        zoom: 17.0,
        bearing: 90.0);
      default:
        return _kGooglePlex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          key:_formKey2,

        children:[
          Expanded(
            child: GoogleMap(

              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: initialPosition(),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          )
        ]),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToMarker() async {
    final GoogleMapController controller = await _controller.future;
    await Future.delayed(Duration(seconds: 1));
    controller.showMarkerInfoWindow(MarkerId(this.service));
  }
}