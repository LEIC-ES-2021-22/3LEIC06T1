import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';


class ServiceDescriptionPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ServiceDescriptionPageState();
}

/// Manages the 'about' section of the app.
class ServiceDescriptionPageState extends SecondaryPageViewState{
  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
      Container(
          width: 0,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
            ),
          ),
          alignment: Alignment.center,
          child: const Text('Secretaria',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF862B27),
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ]
    );
  }
}
