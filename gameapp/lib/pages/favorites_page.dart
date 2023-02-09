import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Text(
              'Favorites',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
