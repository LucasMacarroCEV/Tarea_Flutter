import 'package:flutter/material.dart';
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
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold
  );
  static final List<Widget> _widgetOptions = [
    ChangeNotifierProvider(
        create: (context) => HomeProvider()..getCharacters(),
        child: const HomePage()),
    const Text("Index 1: Favourites", style: optionStyle)
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
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