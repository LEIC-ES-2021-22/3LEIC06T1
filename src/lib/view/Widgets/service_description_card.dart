import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServicePageTitleFilter extends StatelessWidget {
  final String name;

  const ServicePageTitleFilter({Key key, @required this.name}) : super(key: key);

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
      child: const Text('Secretaria',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}