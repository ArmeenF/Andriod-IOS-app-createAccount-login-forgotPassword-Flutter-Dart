import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:undraw/undraw.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material ChallengeCategories(IconData icon, String heading, int color) {
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
        title: Text(
          'Daily Challenges Dashboard',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: <Widget>[
          ChallengeCategories(Icons.graphic_eq, "Categories", 0xff622F74),
          ChallengeCategories(Icons.graphic_eq, "Statistics", 0xff622F74),
          ChallengeCategories(Icons.graphic_eq, "Activity", 0xff622F74),
          ChallengeCategories(Icons.graphic_eq, "Settings", 0xff622F74),
        ],
        staggeredTiles: [
          StaggeredTile.extent(3, 100.0),
          StaggeredTile.extent(1, 100.0),
          StaggeredTile.extent(1, 100.0),
          StaggeredTile.extent(1, 100.0),
        ],
      ),
    );
  }
}
