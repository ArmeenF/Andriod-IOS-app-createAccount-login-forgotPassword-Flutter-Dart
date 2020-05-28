import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thedailychallenge/screens/Categories/Categories.dart';
import 'package:undraw/undraw.dart';
import 'CategoriesList.dart';
import 'Health/healthpage.dart';

class CategoriesCard extends StatelessWidget {
  final CategoriesList categories;
  CategoriesCard({this.categories});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(categories.text,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Completed Challenges'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                '${categories.completed}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  categories.image,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => healthpage()));
                        },
                        icon: Icon(Icons.play_for_work),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 450.0,
            ),
          ],
        ),
      ),
    );
  }
}
