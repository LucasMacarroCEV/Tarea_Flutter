import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Classes/model.dart';
import 'package:flutter_task/Home/home_state.dart';
import 'package:http/http.dart' as client;

class HomeProvider with ChangeNotifier {
  final _charactersLimit = 30;
  int charactersPage = 1;
  
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
        homeState = homeState.copyWith(
            status: HomeStatus.loading
            );
        charactersPage++;
        final charactersList =
            await _fetchCharacters();
        homeState = homeState.copyWith(
            status: HomeStatus.success,
            characters: List.of(homeState.characters)..addAll(charactersList),
            bHasReachedMax: charactersList.length < _charactersLimit,
            );
      }
      notifyListeners();
    } catch (e) {
      homeState = homeState.copyWith(status: HomeStatus.error);
      notifyListeners();
    }
  }

  Future<List<Character>> _fetchCharacters() async {
    await Future.delayed(const Duration(seconds: 1));
    final url = Uri.https(
        "anapioficeandfire.com", "/api/characters", <String, String>{
      "page": "$charactersPage",
      "pageSize": "$_charactersLimit"
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      print(url);
      final List result = json.decode(response.body);
      return result.map((e) => Character.fromJson(e)).toList();      
    }
    throw Exception('Error: No se pudo recibir la información de la API.');
  }
}
