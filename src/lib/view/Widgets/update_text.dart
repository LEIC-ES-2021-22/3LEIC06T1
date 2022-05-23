
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UpdateText extends StatefulWidget {

  UpdateTextState createState() => UpdateTextState();

}

class UpdateTextState extends State {

  String textHolder = 'Old Sample Text...!!!';

  changeText() {
    setState(() {
      print(textHolder);
      textHolder = 'New Sample Text...';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('$textHolder',
                      style: TextStyle(fontSize: 21))),

              RaisedButton(
                onPressed: () => changeText(),
                child: Text('Click Here To Change Text Widget Text Dynamically'),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),

            ]))
    );
  }
}