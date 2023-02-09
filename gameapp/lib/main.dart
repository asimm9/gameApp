import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/favorites_page.dart';
import 'pages/games_page.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> tumSayfalar = [];
  GamePage sayfaGame = const GamePage();
  FavoritesPage sayfaFavorites = const FavoritesPage();

  @override
  void initState() {
    super.initState();
    tumSayfalar = [sayfaGame, sayfaFavorites];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white70,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: tumSayfalar[selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 38,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Games'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
