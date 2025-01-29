import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Character/house.dart';

import 'package:http/http.dart' as client;

class Character {
  String? url, name, gender, culture, born, died, father, mother, spouse;
  List<String>? titles,
      aliases,
      allegiances,
      books,
      povBooks,
      tvSeries,
      playedBy;

  Character({
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    this.titles,
    this.aliases,
    this.father,
    this.mother,
    this.spouse,
    this.allegiances,
    this.books,
    this.povBooks,
    this.tvSeries,
    this.playedBy,
  });

  //---> JSON
  Character.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    gender = json['gender'];
    culture = json['culture'];
    born = json['born'];
    died = json['died'];
    titles = List<String>.from(json['titles'] ?? []);
    aliases = List<String>.from(json['aliases'] ?? []);
    father = json['father'];
    mother = json['mother'];
    spouse = json['spouse'];
    allegiances = List<String>.from(json['allegiances'] ?? []);
    books = List<String>.from(json['books'] ?? []);
    povBooks = List<String>.from(json['povBooks'] ?? []);
    tvSeries = List<String>.from(json['tvSeries'] ?? []);
    playedBy = List<String>.from(json['playedBy'] ?? []);
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'name': name,
    'gender': gender,
    'culture': culture,
    'born': born,
    'died': died,
    'titles': titles,
    'aliases': aliases,
    'father': father,
    'mother': mother,
    'spouse': spouse,
    'allegiances': allegiances,
    'books': books,
    'povBooks': povBooks,
    'tvSeries': tvSeries,
    'playedBy': playedBy
  };
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['url'] = url;
  //   data['name'] = name;
  //   data['gender'] = gender;
  //   data['culture'] = culture;
  //   data['born'] = born;
  //   data['died'] = died;
  //   data['titles'] = titles;
  //   data['aliases'] = aliases;
  //   data['father'] = father;
  //   data['mother'] = mother;
  //   data['spouse'] = spouse;
  //   data['allegiances'] = allegiances;
  //   data['books'] = books;
  //   data['povBooks'] = povBooks;
  //   data['tvSeries'] = tvSeries;
  //   data['playedBy'] = playedBy;
  //   return data;
  // }

  //---> Getters
  String getNumber() => url?.split("/").last ?? "Error";
  String getName() => name?.isNotEmpty ?? false ? name! : "Desconocid@";
  String getCulture() => culture?.isNotEmpty ?? false ? culture! : "Ninguna";
  String getBornDate() => born?.isNotEmpty ?? false ? born! : "s.f.";
  String getDiedDate() => died?.isNotEmpty ?? false ? died! : "s.f.";
  List<String> getTitles() => titles?.isNotEmpty ?? false ? titles! : [];
  List<String> getAliases() => aliases?.isNotEmpty ?? false ? aliases! : [];
  Future<String> getFatherName() async => await fetchCharacterPropertyFromAPI(father ?? "", "name");
  Future<String> getMotherName() async => await fetchCharacterPropertyFromAPI(mother ?? "", "name");
  Future<String> getSpouseName() async => await fetchCharacterPropertyFromAPI(spouse ?? "", "name");
  Future<List<String>> getAllegiances() async {return await fetchCharacterPropertyListFromAPI(allegiances ?? [], "name");}
  Future<List<String>> getBooks() async {return await fetchCharacterPropertyListFromAPI(books ?? [], "name");}
  Future<List<String>> getPovBooks() async {return await fetchCharacterPropertyListFromAPI(povBooks ?? [], "name");}
  //List<String> getBooks() => books?.isNotEmpty ?? false ? books! : [];
  //List<String> getPovBooks() => povBooks?.isNotEmpty ?? false ? povBooks! : [];
  List<String> getTvSeries() => tvSeries?.isNotEmpty ?? false ? tvSeries! : [];
  List<String> getPlayedBy() => playedBy?.isNotEmpty ?? false ? playedBy! : [];

  IconData getGenderIcon() {
    return switch (gender) {
      "Male" => Icons.male_rounded,
      "Female" => Icons.female_rounded,
      _ => Icons.question_answer_rounded,
    };
  }

  String getHouseName() => name!.split(" ").firstWhere((word) => housesMap.containsKey(word), orElse: () => "None");
  String getHouseIcon() => housesMap[getHouseName()]?.icon ?? "assets/icons/32px-None.png";
  Color getHousePrimaryColor() => housesMap[getHouseName()]?.primaryColor ?? housesMap["None"]!.primaryColor;
  Color getHouseSecondaryColor() => housesMap[getHouseName()]?.secondaryColor ?? housesMap["None"]!.secondaryColor;

  //---> Flags
  bool bHasHouse() => bHasName() && name!.split(" ").any(housesMap.containsKey);
  bool bHasName() => name?.isNotEmpty == true;

  //---> Api
  Future<String> fetchCharacterPropertyFromAPI(String characterUrl, String value) async {
  if (characterUrl.isEmpty) return "Desconocido";

    try {
      final response = await client.get(Uri.parse(characterUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data[value] ?? "Desconocido";
      } else {
        return "Desconocido";
      }
    } catch (e) {
      return "Desconocido";
    }
  } 

  Future<List<String>> fetchCharacterPropertyListFromAPI(List<String> characterUrls, String value) async {
    if (characterUrls.isEmpty) return [];

    try {
      List<String> propertyList = await Future.wait(characterUrls.map((url) async {
        final response = await client.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          return data[value]?.toString() ?? "Desconocido";
        } else {
          return "Desconocido";
        }
      }));

      return propertyList;
    } catch (e) {
      print("Error al obtener las propiedades de los personajes: $e");
      return [];
    }
  }

  // Future<List<String>> fetchCharactersPropertyFromAPI(List<String> urls, String value) async {
  // List<String> allies = await Future.wait(urls.map((url) async {
  //   final response = await client.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return data[value] ?? "Desconocido";
  //   } return "Desconocido";})); 
  //   return allies;
  // }
}
