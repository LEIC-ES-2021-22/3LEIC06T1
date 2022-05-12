import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServicePageTitle extends StatelessWidget {
  final String name;

  const ServicePageTitle({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF862B27),
              fontSize: 40,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}