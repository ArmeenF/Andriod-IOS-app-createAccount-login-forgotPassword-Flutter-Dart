import 'package:flutter/material.dart';

// class Facebook extends StatefulWidget {
//   @override
//   _FacebookState createState() => _FacebookState();
// }

class Facebook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FacebookState();
  }
}

class _FacebookState extends State<Facebook> {


  @override
  Widget build(BuildContext context) {
    void printTest(){
      setState(() {
        print("Hello World");
      });
    }
  }
}