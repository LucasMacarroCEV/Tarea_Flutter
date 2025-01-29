import 'package:flutter/material.dart';
import 'package:flutter_task/Character/house.dart';

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
  String getNumber() {
    return url?.split("/").last ?? "Error";
    // if (url!.isNotEmpty) {
    //   List<String>? characterUrlSplitted = url?.split("/");
    //   return characterUrlSplitted!.last;
    // } else {
    //   return "Error";
    // }
  }

  String getName() {
    return name?.isNotEmpty ?? false ? name! : "Desconocid@";
    // if (name!.isNotEmpty) {
    //   return name!;
    // } else {
    //   return "Desconocido";
    // }
  }

  IconData getGenderIcon() {
    switch (gender) {
      case "Male":
        return Icons.male_rounded;
      case "Female":
        return Icons.female_rounded;
      default:
        return Icons.question_answer_rounded;
    }
    // if (gender! == "Male") {
    //   return Icons.male_rounded;
    // } else if (gender! == "Female") {
    //   return Icons.female_rounded;
    // } else {
    //   return Icons.question_answer_rounded;
    // }
  }

  String getHouseIcon() {
    if (name?.isNotEmpty ?? false) {
      for (var word in name!.split(" ")) {
        if (housesMap.containsKey(word)) {
          return housesMap[word]!.icon;
        }
      }
    }
    return "assets/icons/32px-None.png";
    // String houseIcon = "assets/icons/32px-None.png";
    // if (name!.isNotEmpty) {
    //   name!.split(" ").forEach((word) {
    //     if (housesMap.containsKey(word)) {
    //       houseIcon = housesMap[word]!.icon;
    //     }
    //   });
    // }
    // return houseIcon;
  }

  Color getHousePrimaryColor() {
    if (name?.isNotEmpty ?? false) {
      for (var word in name!.split(" ")) {
        if (housesMap.containsKey(word)) {
          return housesMap[word]!.primaryColor;
        }
      }
    }
    return housesMap["None"]!.primaryColor;
    // Color primaryColor = housesMap["None"]!.primaryColor;
    // if (name!.isNotEmpty) {
    //   name!.split(" ").forEach((word) {
    //     if (housesMap.containsKey(word)) {
    //       primaryColor = housesMap[word]!.primaryColor;
    //     }
    //   });
    // }
    // return primaryColor;
  }

  Color getHouseSecondaryColor() {
    if (name?.isNotEmpty ?? false) {
      for (var word in name!.split(" ")) {
        if (housesMap.containsKey(word)) {
          return housesMap[word]!.secondaryColor;
        }
      }
    }
    return housesMap["None"]!.secondaryColor;
    // Color secondaryColor = housesMap["None"]!.secondaryColor;
    // if (name!.isNotEmpty) {
    //   name!.split(" ").forEach((word) {
    //     if (housesMap.containsKey(word)) {
    //       secondaryColor = housesMap[word]!.secondaryColor;
    //     }
    //   });
    // }
    // return secondaryColor;
  }
}
