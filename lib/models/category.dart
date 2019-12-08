import 'package:flutter/material.dart';
//constructor
class Category {
  final String id;
  final String title;
  final Color color;
//named arguments
  const Category({ 
   @required this.id, 
   @required this.title, 
   this.color = Colors.blue});
}
