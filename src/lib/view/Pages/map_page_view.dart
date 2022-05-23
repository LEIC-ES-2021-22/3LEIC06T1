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
  @override
  State<StatefulWidget> createState() => AboutPageViewState();
}

/// Manages the 'about' section of the app.
class AboutPageViewState extends GeneralPageViewState {


  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Mapa")),
          backgroundColor: Colors.cyan,
        ),
        body: MapSample(),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor currentPosIcon;
  Map<String, LatLng> services = HashMap();
  Map<String, String> servicesInfo = HashMap();
  List<Service> serviceList;


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Row(
            children: [
              Expanded(child: TextFormField()),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: _kGooglePlex,
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}