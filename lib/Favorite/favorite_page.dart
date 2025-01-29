import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task/Character/model.dart';
import 'package:flutter_task/CustomWidgets/character_container.dart';
import 'package:flutter_task/Favorite/favorite_handler.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late StreamSubscription<List<Character>> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = FavoritesHandler.stream.listen((updatedList) {
      if (mounted) {
        setState(() {});
      }
    });
    //_subscription = FavoritesHandler.stream.listen((updatedList) {setState(() {});});
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCharacters = FavoritesHandler.getFavoriteCharacters();

    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        //padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
        ),
        itemCount: favoriteCharacters.length,
        itemBuilder: (context, index) {
          return Center(
            child: CharacterContainer(
              key: ValueKey(favoriteCharacters[index].getNumber()),
              character: favoriteCharacters[index],
              size: 230,
            )
          );
        }
      ),
    );
  }
}