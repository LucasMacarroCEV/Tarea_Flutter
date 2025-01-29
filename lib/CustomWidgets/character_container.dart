import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task/Character/model.dart';
import 'package:flutter_task/Favorite/favorite_handler.dart';

class CharacterContainer extends StatefulWidget {
  const CharacterContainer({super.key, required this.character, required this.size});
  final Character character;
  final double size;

  @override
  State<CharacterContainer> createState() => _CharacterContainerState();
}

class _CharacterContainerState extends State<CharacterContainer> {
  late double size;
  late Character character;
  late IconData favoriteButtonIcon;
  late StreamSubscription<List<Character>> _subscription;

  @override
  void initState(){
    super.initState();
    size = widget.size;
    character = widget.character;
    favoriteButtonIcon = _getFavoriteButtonIcon();
    
    _subscription = FavoritesHandler.stream.listen((updatedList) {
      if (mounted) {
        final newFavoriteButtonIcon = _getFavoriteButtonIcon();
        if (favoriteButtonIcon != newFavoriteButtonIcon) {
          setState(() {
            favoriteButtonIcon = newFavoriteButtonIcon;
          });
        }
        // setState(() {
        //   favoriteButtonIcon = _getFavoriteButtonIcon();
        // });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Container clicked");
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: character.getHousePrimaryColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: character.getHouseSecondaryColor(), width: 2.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(85),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: _onFavoriteButtonPressed,
                      icon: Icon(favoriteButtonIcon, size: (12 / 100) * size)),
                    Text(character.getNumber(),
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (7 / 100) * size))
                  ],
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    character.getName(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: (12.5 / 100) * size, color: character.getHouseSecondaryColor())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(character.getHouseIcon()),
                      width: (15 / 100) * size,
                      height: (16.2855 / 100) * size),
                    Icon(
                      character.getGenderIcon(),
                      size: (12 / 100) * size,
                    )
                  ],
                )
              ]
            )
          ),
        )
    );
  }

  //---> Favorite Button
  void _onFavoriteButtonPressed() {
    FavoritesHandler.addToFavoriteCharacters(character);
    // setState(() {
    //   favIcon = _getFavoriteButtonIcon();
    // });
  }

  IconData _getFavoriteButtonIcon() {
    return FavoritesHandler.bInFavoriteCharacters(character) ? Icons.star : Icons.star_border_outlined;
    // if (FavoritesHandler.bInFavoriteCharacters(character)) {
    //   return Icons.star;
    // } else {
    //   return Icons.star_border_outlined;
    // }
  }
}