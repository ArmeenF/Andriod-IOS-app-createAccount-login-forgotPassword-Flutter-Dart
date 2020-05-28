import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thedailychallenge/models/user.dart';
import 'package:thedailychallenge/screens/wrapper.dart';
import 'package:thedailychallenge/services/auth.dart';
import 'package:thedailychallenge/shared/constants.dart';

import 'notifier/task_notifier.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => TaskNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: wrapper()),
    );
  }
}
