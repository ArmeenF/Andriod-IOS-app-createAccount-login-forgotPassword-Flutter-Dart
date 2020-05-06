import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thedailychallenge/models/user.dart';
import 'package:thedailychallenge/screens/home/home.dart';
import 'package:thedailychallenge/screens/authenticate/authenticate.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    
    //return either home or authenticate widget
    if(user == null)
    {
      return Authenticate();
    }
    else
    {
      return Home();
    }
  }
}