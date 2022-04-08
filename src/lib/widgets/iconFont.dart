import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  Color color;
  double size;
  String name;

  IconFont({required this.color, required this.size, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(this.name,
        style: TextStyle(
            color: this.color,
            fontSize: this.size,
            fontFamily: 'orrila'
        )
    );
  }
}