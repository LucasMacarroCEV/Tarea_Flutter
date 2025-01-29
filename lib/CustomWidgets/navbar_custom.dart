import 'package:flutter/material.dart';
import 'package:flutter_task/Favorite/favorite_handler.dart';
import 'package:flutter_task/Favorite/favorite_page.dart';
import 'package:flutter_task/Home/home_page.dart';
import 'package:flutter_task/Home/home_provider.dart';
import 'package:provider/provider.dart';

class CustomBotNavBar extends StatefulWidget {
  const CustomBotNavBar({super.key});

  @override
  State<CustomBotNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomBotNavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FavoritesHandler.loadFavoriteCharactersFromSharedPrefs();
  }

  static final List<Widget> _widgetOptions = [
    ChangeNotifierProvider(
      create: (context) => HomeProvider()..getCharactersFromAPI(),
      child: const HomePage(),
    ),
    const FavoritePage(),
  ];
  // static final List<Widget> _widgetOptions = [
  //   ChangeNotifierProvider(
  //       create: (context) => HomeProvider()..getCharacters(),
  //       child: const HomePage()),
  //   const FavoritePage()
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Personajes",
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
            backgroundColor: Colors.green
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
        ),
    );
  }
}