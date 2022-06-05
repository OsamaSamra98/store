import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  late String name;

  CategoryCard({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Chip(
            label: Center(child: Text(name)))
      ],
    );
  }
}
