import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryWidget({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(category),
        ),
      ),
    );
  }
}
