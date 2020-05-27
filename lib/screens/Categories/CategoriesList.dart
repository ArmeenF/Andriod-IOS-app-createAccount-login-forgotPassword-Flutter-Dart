import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class CategoriesList {
  String text;
  UnDraw image;
  int completed = 0;

  CategoriesList({this.text, this.image, this.completed}) {
    completed = 0;
  }
  getCompleted() {
    return completed;
  }

  setCompleted(int number) {
    completed = number;
  }
}
