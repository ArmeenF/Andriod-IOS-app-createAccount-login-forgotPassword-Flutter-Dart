import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context0){
    return Container(
      color: Colors.purple[200],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.blue[400],
          size: 100.0,
        ),
      ),
    );
  }
}