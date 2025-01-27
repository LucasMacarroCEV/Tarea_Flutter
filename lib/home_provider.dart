import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Classes/character.dart';
import 'package:flutter_task/home_state.dart';
import 'package:http/http.dart' as client;

class HomeProvider with ChangeNotifier {
  final _charactersLimit = 30;

  var homeState = const HomeState<Character>();

  Future<void> getCharacters() async {
    try {
      if (homeState.status == HomeStatus.initial) {
        final charactersList = await _fetchCharacters();
        homeState = homeState.copyWith(
            status: HomeStatus.success,
            characters: charactersList,
            bHasReachedMax: charactersList.length < _charactersLimit);
      } else {
        final charactersList =
            await _fetchCharacters(homeState.characters.length);
        homeState = homeState.copyWith(
            status: HomeStatus.success,
            characters: List.of(homeState.characters)..addAll(charactersList),
            bHasReachedMax: charactersList.length < _charactersLimit);
      }
      notifyListeners();
    } catch (e) {
      homeState = homeState.copyWith(status: HomeStatus.error);
      notifyListeners();
    }
  }

  Future<List<Character>> _fetchCharacters([int startIndex = 0]) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await client.get(Uri.https(
        "anapioficeandfire.com", "/api/characters", <String, String>{
      "page": "$startIndex",
      "pageSize": "$_charactersLimit"
    }));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Character.fromJson(e)).toList();
    }
    throw Exception('Error: No se pudo recibir la información de la API.');
  }
}
