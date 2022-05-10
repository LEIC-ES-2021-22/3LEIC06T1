import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageViewState();
}

/// Manages the 'about' section of the app.
class AboutPageViewState extends GeneralPageViewState {

  GoogleMapController mapController;

  final LatLng _center = const LatLng(41.17817607238003, -8.596451894896566);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Feup's Map")),
          backgroundColor: Colors.cyan,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
            bearing: 90.0,
          ),
        ),
      ),
    );
  }
}
