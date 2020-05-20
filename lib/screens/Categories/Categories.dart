import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("Categories"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to login page
          },
          child: Text('Go back To Dashboard!'),
        ),
      ),
    );
  }
}
