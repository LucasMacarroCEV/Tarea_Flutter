
import 'dart:convert';

import 'package:flutter_task/Classes/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteSingleton {
  static List<Character> favCharacters = [];

  FavoriteSingleton._internal();

  static final FavoriteSingleton _singelton = FavoriteSingleton._internal();

  factory FavoriteSingleton() {
    return _singelton;
  }

  static void setFavChar(List<Character> charList) {
    favCharacters = charList;
  }

  static List<Character> getFavChar() {
    return favCharacters;
  }

  static bool bInFavCharsList(Character character) {
    if (!favCharacters.contains(character)) {
      return false;
    } else {
      return true;
    }
  }

  static void loadFavChar() {
    getFavoriteCharacters();
  }

  static void addToFavCharList(Character character) {
    if (!favCharacters.contains(character)) {
      print("NO esta en favs");
      setFavChar(List.of(favCharacters)..add(character));
    } else {
      print("esta en favs");
      setFavChar(List.of(favCharacters)..remove(character));
    }
    setFavoriteCharacters();
  }

  static Future<void> getFavoriteCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favorites')) {
      final List result = await json.decode(prefs.getString('favorites')!);
      final favoriteCharactersList = result.map((e) => Character.fromJson(e)).toList();
      setFavChar(List.of(favCharacters)..addAll(favoriteCharactersList));
    } else {print("Nuevo archivo de guardado local"); setFavoriteCharacters();}
  }

  static Future<void> setFavoriteCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final favJson = favCharacters.map((e) => e.toJson()).toList();
    await prefs.setString('favorites', jsonEncode(favJson));
    print("favChars guardados - ${favCharacters.map((i) => i.name)}");
  }
}