import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String name;
  String category;
  Timestamp createdAt;

  Task.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['image'];
    createdAt = data['createdAt'];
  }
}
