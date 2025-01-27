import 'package:flutter/material.dart';
import 'package:flutter_task/Classes/house.dart';

class Character {
  String? url, name, gender, culture, born, died, father, mother, spouse;
  List<dynamic>? titles,
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

  Character.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    gender = json['gender'];
    culture = json['culture'];
    born = json['born'];
    died = json['died'];
    titles = json['titles'];
    aliases = json['aliases'];
    father = json['father'];
    mother = json['mother'];
    spouse = json['spouse'];
    allegiances = json['allegiances'];
    books = json['books'];
    povBooks = json['povBooks'];
    tvSeries = json['tvSeries'];
    playedBy = json['playedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['gender'] = gender;
    data['culture'] = culture;
    data['born'] = born;
    data['died'] = died;
    data['titles'] = titles;
    data['aliases'] = aliases;
    data['father'] = father;
    data['mother'] = mother;
    data['spouse'] = spouse;
    data['allegiances'] = allegiances;
    data['books'] = books;
    data['povBooks'] = povBooks;
    data['tvSeries'] = tvSeries;
    data['playedBy'] = playedBy;
    return data;
  }

  String getNumber() {
    if (url!.isNotEmpty) {
      List<String>? characterUrlSplitted = url?.split("/");
      return characterUrlSplitted!.last;
    } else {
      return "Error";
    }
  }

  String getName() {
    if (name!.isNotEmpty) {
      return name!;
    } else {
      return "Desconocido";
    }
  }

  IconData getGenderIcon() {
    if (gender! == "Male") {
      return Icons.male_rounded;
    } else if (gender! == "Female") {
      return Icons.female_rounded;
    } else {
      return Icons.question_answer_rounded;
    }
  }

  String getHouseIcon() {
    String houseIcon = "assets/icons/32px-None.png";
    if (name!.isNotEmpty) {
      name!.split(" ").forEach((word) {
        if (housesMap.containsKey(word)) {
          houseIcon = housesMap[word]!.icon;
        }
      });
    }
    return houseIcon;
  }

  Color getHousePrimaryColor() {
    Color primaryColor = housesMap["None"]!.primaryColor;
    if (name!.isNotEmpty) {
      name!.split(" ").forEach((word) {
        if (housesMap.containsKey(word)) {
          primaryColor = housesMap[word]!.primaryColor;
        }
      });
    }
    return primaryColor;
  }

  Color getHouseSecondaryColor() {
    Color secondaryColor = housesMap["None"]!.secondaryColor;
    if (name!.isNotEmpty) {
      name!.split(" ").forEach((word) {
        if (housesMap.containsKey(word)) {
          secondaryColor = housesMap[word]!.secondaryColor;
        }
      });
    }
    return secondaryColor;
  }
}
