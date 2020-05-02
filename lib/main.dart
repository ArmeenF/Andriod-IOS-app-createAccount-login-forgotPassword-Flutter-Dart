import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _challenge_categories = [
    'Health',
    'Educational',
    'Dietary',
    'Social',
    'General',
    'Mental'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Challenge App',
      theme: ThemeData(
        primaryColor: new Color(0xff622F74),
      ),
      home: Dashboard(),
    );
  }
}
