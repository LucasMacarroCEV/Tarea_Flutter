import 'package:flutter/material.dart';

class Character {
  String? url, name, gender, culture, born, died, father, mother, spouse;
  // List<String>? titles,
  //     aliases,
  //     allegiances,
  //     books,
  //     povBooks,
  //     tvSeries,
  //     playedBy;

  Character({
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    //this.titles,
    //this.aliases,
    this.father,
    this.mother,
    this.spouse,
    //this.allegiances,
    //this.books,
    //this.povBooks,
    //this.tvSeries,
    //this.playedBy,
  });

  Character.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    gender = json['gender'];
    culture = json['culture'];
    born = json['born'];
    died = json['died'];
    //titles = json['titles'];
    //aliases = json['aliases'];
    father = json['father'];
    mother = json['mother'];
    spouse = json['spouse'];
    //allegiances = json['allegiances'];
    //books = json['books'];
    //povBooks = json['povBooks'];
    //tvSeries = json['tvSeries'];
    //playedBy = json['playedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['gender'] = gender;
    data['culture'] = culture;
    data['born'] = born;
    data['died'] = died;
    //data['titles'] = titles;
    //data['aliases'] = aliases;
    data['father'] = father;
    data['mother'] = mother;
    data['spouse'] = spouse;
    //data['allegiances'] = allegiances;
    //data['books'] = books;
    //data['povBooks'] = povBooks;
    //data['tvSeries'] = tvSeries;
    //data['playedBy'] = playedBy;
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
}

// const Character(
//     {required this.url,
//     required this.name,
//     required this.gender,
//     required this.culture,
//     required this.born,
//     required this.died,
//     required this.titles,
//     required this.aliases,
//     required this.father,
//     required this.mother,
//     required this.spouse,
//     required this.allegiances,
//     required this.books,
//     required this.povBooks,
//     required this.tvSeries,
//     required this.playedBy});
// factory Character.fromJson(Map<String, dynamic> json) {
//   return Character(
//       url: json['url'] as String,
//       name: json['name'] as String,
//       gender: json['gender'] as String,
//       culture: json['culture'] as String,
//       born: json['born'] as String,
//       died: json['died'] as String,
//       titles: json['titles'] as List<String>,
//       aliases: json['aliases'] as List<String>,
//       father: json['father'] as String,
//       mother: json['mother'] as String,
//       spouse: json['spouse'] as String,
//       allegiances: json['allegiances'] as List<String>,
//       books: json['books'] as List<String>,
//       povBooks: json['povBooks'] as List<String>,
//       tvSeries: json['tvSeries'] as List<String>,
//       playedBy: json['playedBy'] as List<String>);
// }
