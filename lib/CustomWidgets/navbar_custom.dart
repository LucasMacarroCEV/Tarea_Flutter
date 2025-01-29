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
        backgroundColor: Color.fromRGBO(180, 180, 180, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromRGBO(10, 10, 10, 1),),
            label: "Personajes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Color.fromRGBO(240, 180, 55, 1)),
            label: "Favoritos",
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(255, 255, 255, 1.0),
        onTap: _onItemTapped,
        ),
    );
  }
}