import 'package:flutter/material.dart';

class House {
  String icon;
  Color primaryColor;
  Color secondaryColor;
  Color fontColor;

  House(this.icon, this.primaryColor, this.secondaryColor, this.fontColor);
}

Map<String, House> housesMap = {
  "None": House(
      "assets/icons/32px-None.png",
      const Color.fromRGBO(255, 255, 255, 1),
      const Color.fromRGBO(195, 195, 195, 1),
      const Color.fromRGBO(195, 195, 195, 1)),
  "Arryn": House(
      "assets/icons/32px-House_Arryn.png",
      const Color.fromRGBO(231, 231, 232, 1),
      const Color.fromRGBO(0, 128, 210, 1),
      const Color.fromRGBO(0, 128, 210, 1)),
  "Baratheon": House(
      "assets/icons/32px-House_Baratheon.png",
      const Color.fromRGBO(28, 29, 34, 1),
      const Color.fromRGBO(245, 206, 62, 1),
      const Color.fromRGBO(245, 206, 62, 1)),
  "Greyjoy": House(
      "assets/icons/32px-House_Greyjoy.png",
      const Color.fromRGBO(245, 206, 62, 1),
      const Color.fromRGBO(28, 29, 34, 1),
      const Color.fromRGBO(28, 29, 34, 1)),
  "Lannister": House(
      "assets/icons/32px-House_Lannister.png",
      const Color.fromRGBO(250, 197, 65, 1),
      const Color.fromRGBO(199, 12, 27, 1),
      const Color.fromRGBO(199, 12, 27, 1)),
  "Martell": House(
      "assets/icons/32px-House_Martell.png",
      const Color.fromRGBO(221, 49, 55, 1),
      const Color.fromRGBO(233, 116, 42, 1),
      const Color.fromRGBO(233, 116, 42, 1)),
  "Stark": House(
      "assets/icons/32px-House_Stark.png",
      const Color.fromRGBO(140, 140, 140, 1),
      const Color.fromRGBO(241, 241, 241, 1),
      const Color.fromRGBO(241, 241, 241, 1)),
  "Targaryen": House(
      "assets/icons/32px-House_Targaryen.png",
      const Color.fromRGBO(179, 34, 39, 1),
      const Color.fromRGBO(14, 14, 14, 1),
      const Color.fromRGBO(14, 14, 14, 1)),
  "Tully": House(
      "assets/icons/32px-House_Tully.png",
      const Color.fromRGBO(206, 206, 206, 1),
      const Color.fromRGBO(0, 35, 172, 1),
      const Color.fromRGBO(0, 35, 172, 1)),
  "Tyrell": House(
      "assets/icons/32px-House_Tyrell.png",
      const Color.fromRGBO(243, 240, 139, 1),
      const Color.fromRGBO(0, 128, 37, 1),
      const Color.fromRGBO(0, 128, 37, 1)),
  "Hightower": House(
      "assets/icons/32px-House_Hightower.png",
      const Color.fromRGBO(227, 227, 227, 1),
      const Color.fromRGBO(255, 124, 57, 1),
      const Color.fromRGBO(255, 124, 57, 1))
};

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

  Color getHouseFontColor() {
    Color fontColor = housesMap["None"]!.fontColor;
    if (name!.isNotEmpty) {
      name!.split(" ").forEach((word) {
        if (housesMap.containsKey(word)) {
          fontColor = housesMap[word]!.fontColor;
        }
      });
    }
    return fontColor;
  }
}
