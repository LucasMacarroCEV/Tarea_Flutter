import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task/Character/model.dart';
import 'package:flutter_task/Home/home_state.dart';
import 'package:http/http.dart' as client;

class HomeProvider with ChangeNotifier {
  final _charactersLimit = 30;
  int charactersPage = 1;
  int maxCharacterId = 2134;
  Character? randomCharacter;
  
  var homeState = const HomeState<Character>();
  
  Future<void> getCharactersFromAPI() async {
    try {
      if (homeState.status == HomeStatus.initial) {
        final charactersList = await _fetchCharactersFromAPI();
        homeState = homeState.copyWith(
            status: HomeStatus.success,
            characters: charactersList,
            bHasReachedMax: charactersList.length < _charactersLimit);
      } else {
        homeState = homeState.copyWith(status: HomeStatus.loading);
        charactersPage++;
        final charactersList = await _fetchCharactersFromAPI();
        homeState = homeState.copyWith(
            status: HomeStatus.success,
            characters: [...homeState.characters, ...charactersList],
            //List.of(homeState.characters)..addAll(charactersList),
            bHasReachedMax: charactersList.length < _charactersLimit,
            );
      }
      notifyListeners();
    } catch (e) {
      homeState = homeState.copyWith(status: HomeStatus.error);
      notifyListeners();
    }
  }

  Future<List<Character>> _fetchCharactersFromAPI() async {
    await Future.delayed(const Duration(seconds: 1));
    final url = Uri.https(
        "anapioficeandfire.com", "/api/characters", <String, String>{
      "page": "$charactersPage",
      "pageSize": "$_charactersLimit"
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Character.fromJson(e)).toList();      
    } else {
      throw Exception('Error: No se pudo recibir la información de la API.');
    }
  }

//---> Random Character
  Future<void> getRandomCharacterFromAPI() async {
    try {
      randomCharacter = await _fetchRandomCharacterFromAPI();
      notifyListeners();
    } catch (e) {
      throw Exception("Error: No se pudo obtener el personaje aleatorio");
    }
  }

  Future<Character> _fetchRandomCharacterFromAPI() async {
    final randomId = Random().nextInt(maxCharacterId);
    final url = Uri.https("anapioficeandfire.com", "/api/characters/$randomId");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Character.fromJson(result);
    }
    throw Exception('Error: No se pudo obtener un personaje aleatorio de la API.');
  }
}
