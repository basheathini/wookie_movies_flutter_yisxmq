import 'package:flutter/material.dart';
import '../features/search/screens/search_movies_screen.dart';

class SearchTextBox extends StatelessWidget {
  final String title;
  final double? height;

  const SearchTextBox({super.key,
    required this.title,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchMoviesScreen()),
        );
      },
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: title,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}