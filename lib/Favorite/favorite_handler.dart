import 'dart:async';
import 'dart:convert';

import 'package:flutter_task/Character/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesHandler{
  static List<Character> _favoriteCharacters = [];

  FavoritesHandler._internal();

  static final FavoritesHandler _singelton = FavoritesHandler._internal();

  factory FavoritesHandler() {
    return _singelton;
  }

  static void dispose() {
    _streamController.close();
  }

  //---> Stream Controller
  static final StreamController<List<Character>> _streamController = StreamController.broadcast();
  static Stream<List<Character>> get stream => _streamController.stream;

  //---> Getters
  static List<Character> getFavoriteCharacters() {
    return List.unmodifiable(_favoriteCharacters);
    //return favoriteCharacters;
  }

  //---> Setters
  static void setFavoriteCharacters(List<Character> charactersList) {
    _favoriteCharacters = List.from(charactersList);
    saveFavoriteCharactersToSharePrefs();
    _streamController.add(List.from(_favoriteCharacters));
  }

  static void addToFavoriteCharacters(Character character) {
    if (!_favoriteCharacters.any((favoriteCharacter) => favoriteCharacter.getNumber() == character.getNumber())) {
      //setFavoriteCharacters(List.of(_favoriteCharacters)..add(character));
      setFavoriteCharacters([..._favoriteCharacters, character]);
    } else {
      //setFavoriteCharacters(List.of(_favoriteCharacters)..remove(_favoriteCharacters.firstWhere((favoriteCharacter) => favoriteCharacter.getNumber() == character.getNumber())));
      setFavoriteCharacters(_favoriteCharacters.where((favoriteCharacter) => favoriteCharacter.getNumber() != character.getNumber()).toList(),
      );
    }
  }

  //---> Flags
  static bool bInFavoriteCharacters(Character character) {
    return _favoriteCharacters.any((favoriteCharacter) => favoriteCharacter.getNumber() == character.getNumber());
    //if (!_favoriteCharacters.any((favoriteCharacter) => favoriteCharacter.getNumber() == character.getNumber())) {return false;} else {return true;}
  }

  //---> Shared Preferences
  static void loadFavoriteCharactersFromSharedPrefs() {
    getFavoriteCharactersFromSharedPrefs();
  }

  static Future<void> getFavoriteCharactersFromSharedPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('favorites')) {
        final List result = json.decode(prefs.getString('favorites')!);
        final favoriteCharactersList = result.map((e) => Character.fromJson(e)).toList();
        setFavoriteCharacters(favoriteCharactersList);
        print("favChars cargados - ${_favoriteCharacters.map((i) => i.name)}");
      } else {
        saveFavoriteCharactersToSharePrefs();
      }
    } catch (e) {
      print("Error al cargar favoritos: $e");
    }

    // final prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey('favorites')) {
    //   final List result = await json.decode(prefs.getString('favorites')!);
    //   final favoriteCharactersList = result.map((e) => Character.fromJson(e)).toList();
    //   setFavoriteCharacters(favoriteCharactersList);
    //   print("favChars cargados - ${_favoriteCharacters.map((i) => i.name)}");
    // } else {saveFavoriteCharactersToSharePrefs();}
  }

  static Future<void> saveFavoriteCharactersToSharePrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favJson = _favoriteCharacters.map((e) => e.toJson()).toList();
      await prefs.setString('favorites', jsonEncode(favJson));
      print("favChars guardados - ${_favoriteCharacters.map((i) => i.name)}");
    } catch (e) {
      print("Error al guardar favoritos: $e");
    }
    
    // final prefs = await SharedPreferences.getInstance();
    // final favJson = _favoriteCharacters.map((e) => e.toJson()).toList();
    // await prefs.setString('favorites', jsonEncode(favJson));
    // print("favChars guardados - ${_favoriteCharacters.map((i) => i.name)}");
  }
}