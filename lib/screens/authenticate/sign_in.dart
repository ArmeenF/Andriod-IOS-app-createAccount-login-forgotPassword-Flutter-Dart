import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:thedailychallenge/screens/home/home.dart';
import 'package:thedailychallenge/services/auth.dart';
import 'package:thedailychallenge/shared/constants.dart';
import 'package:thedailychallenge/shared/loading.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _authfb = FirebaseAuth.instance;
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  void _signInFaceBook() async {
    FacebookLogin facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    if (result.status == FacebookLoginStatus.loggedIn) {
      final Credential = FacebookAuthProvider.getCredential(accessToken: token);
      _authfb.signInWithCredential(Credential);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.purple[200],
            appBar: AppBar(
              backgroundColor: Colors.purple[800],
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Register'),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.blue[400],
                        child: Text(
                          'sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                                loading = false;
                              });
                            }
                          }
                        }),
                    Container(
                        padding: const EdgeInsets.all(0.0),
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: InkWell(
                          child: Image.asset(
                            'images/fb2_login.png',
                          ),
                          onTap: () {
                            _signInFaceBook();
                          },
                        )),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}