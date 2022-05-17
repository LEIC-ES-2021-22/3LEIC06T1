import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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

  void setIcon() async {
    currentPosIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/myPos.png');
    //currentPosIcon = BitmapDescriptor.defaultMarker;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setIcon();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("_kGooglePlex"),
          infoWindow: InfoWindow(title: "Estás aqui"),
          icon: currentPosIcon,
          position: LatLng(41.17817607238003, -8.596451894896566),
        ),
      );
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
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
      ),
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