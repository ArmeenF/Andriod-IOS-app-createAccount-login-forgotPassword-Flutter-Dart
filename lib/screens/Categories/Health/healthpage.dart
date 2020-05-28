import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';
import '../Categories_Card.dart';

class healthpage extends StatefulWidget {
  @override
  _healthpageState createState() => _healthpageState();
}

class _healthpageState extends State<healthpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text("Health"),
        ),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UnDraw(
                illustration: UnDrawIllustration.working_out,
                color: Colors.deepPurpleAccent,
                alignment: Alignment.topCenter,
                width: 300,
              )
            ],
          ),
        ));
  }
}
