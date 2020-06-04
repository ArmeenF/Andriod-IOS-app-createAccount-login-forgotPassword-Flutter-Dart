import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thedailychallenge/screens/authenticate/sign_in.dart';
import 'package:thedailychallenge/shared/constants.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text('Reset Password'),
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Please enter your email below.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your email";
                          } else {
                            email = value;
                          }
                          return null;
                        }),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
                        child: RaisedButton(
                            color: Colors.blue[400],
                            child: Text('submit',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                FirebaseAuth.instance
                                    .sendPasswordResetEmail(email: email)
                                    .then((value) => showAlertDialog(context));
                              }
                            }))       
                  ],
                ),
              )),
        ));
  }
}
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Password Reset Link Sent"),
    content: Text(
        "Please check your inbox for a link to reset your password affiliated with the submitted email above."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
