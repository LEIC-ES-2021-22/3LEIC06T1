import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';

class MapPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageViewState();
}

/// Manages the 'about' section of the app.
class AboutPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        Text(
          'Mapa',
          textAlign: TextAlign.center,
        ),
        Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: queryData.size.width / 12,
                  right: queryData.size.width / 12,
                  top: queryData.size.width / 12,
                  bottom: queryData.size.width / 12),
              child: Text(
                'Ola eu sou um widget',
                textAlign: TextAlign.center,
                )
            ))
      ],
    );
  }
}
