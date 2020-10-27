import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.title,
    @required this.id,
    this.color = Colors.orange,
  });
}
