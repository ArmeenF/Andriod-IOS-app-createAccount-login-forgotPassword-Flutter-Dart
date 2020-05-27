import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'CategoriesList.dart';
import 'Categories_Card.dart';
import 'package:undraw/undraw.dart';

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<CategoriesList> categories = [
    CategoriesList(
        text: "Health",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.activity_tracker,
          color: Colors.purple,
        )),
    CategoriesList(
        text: "Education",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.learning,
          color: Colors.purple,
        )),
    CategoriesList(
        text: "Social",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.social_networking,
          color: Colors.purple,
        )),
    CategoriesList(
        text: "Mental",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.relaxing_at_home,
          color: Colors.purple,
        )),
    CategoriesList(
        text: "Diet",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.eating_together,
          color: Colors.purple,
        )),
    CategoriesList(
        text: "General",
        image: UnDraw(
          width: 80,
          height: 80,
          illustration: UnDrawIllustration.adventure,
          color: Colors.purple,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(Icons.done),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: categories
              .map((categories) => CategoriesCard(categories: categories))
              .toList(),
        )));
  }
}
