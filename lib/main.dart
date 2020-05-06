import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thedailychallenge/models/user.dart';
import 'package:thedailychallenge/screens/wrapper.dart';
import 'package:thedailychallenge/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}

