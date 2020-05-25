import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'CategoriesList.dart';

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<CategoriesList> categories = [
    CategoriesList(text: "Health"),
    CategoriesList(text: "Education"),
    CategoriesList(text: "Social"),
  ];

  Widget categoryTemplate(categories) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(categories.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.purple,
                  )),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }

  int healthComplet;
  int educationComplet;
  int socialComplet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.done),
        ),
        body: Column(
          children: categories
              .map((categories) => categoryTemplate(categories))
              .toList(),
        ));
  }
}
