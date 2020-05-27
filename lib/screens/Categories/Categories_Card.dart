import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';
import 'CategoriesList.dart';

class CategoriesCard extends StatelessWidget {
  final CategoriesList categories;
  CategoriesCard({this.categories});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Text(categories.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              )),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Completed Challenges #'),
            ],
          ),
          new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('$categories.completed')]),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              categories.image,
            ],
          ),
          SizedBox(
            height: 100.0,
            width: 450.0,
          ),
        ],
      ),
    );
  }
}
