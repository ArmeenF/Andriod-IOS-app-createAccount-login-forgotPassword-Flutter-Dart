import 'package:flutter/material.dart';
import 'package:thedailychallenge/services/auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thedailychallenge/screens/Categories/Categories.dart';

class Home extends StatelessWidget {
//
  final AuthService _auth = AuthService();

// class _HomeState extends State<Home> {
  Material ChallengeCategories(
      IconData icon, String heading, int color, Function onTap) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    heading,
                    style: TextStyle(color: new Color(color), fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard'),
          backgroundColor: Colors.purple[800],
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                })
          ]),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepPurple,
                  Colors.deepPurpleAccent,
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/fakelogo.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Daily Challenge',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                )),
            CustomListTile(Icons.person, 'profile', () => {}),
            CustomListTile(Icons.notifications, 'Notifications', () => {}),
            CustomListTile(Icons.settings, 'Settings', () => {}),
          ],
        ),
      ),
      body: RaisedButton(
        child: Text('Categories'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => categories()));
          // Navigate to second route when tapped.
        },
      ),

      // body: StaggeredGridView.count(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 10.0,
      //   mainAxisSpacing: 10.0,
      //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //   children: <Widget>[
      //     ChallengeCategories(Icons.graphic_eq, "Categories", 0xff622F74, () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => categories()));
      //     }),
      //     ChallengeCategories(
      //         Icons.graphic_eq, "Statistics", 0xff622F74, () {}),
      //     ChallengeCategories(
      //         Icons.graphic_eq, "Activity", 0xff622F74, () {}),
      //     ChallengeCategories(
      //         Icons.graphic_eq, "Settings", 0xff622F74, () {}),
      //   ],
      //   staggeredTiles: [
      //     StaggeredTile.extent(3, 100.0),
      //     StaggeredTile.extent(1, 100.0),
      //     StaggeredTile.extent(1, 100.0),
      //     StaggeredTile.extent(1, 100.0),
      //   ],
    )
        // )
        ;
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 5.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.purpleAccent,
            onTap: onTap,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            )),
      ),
    );
  }
}
