import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'character.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const FlutterTaskApp());
}

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 71, 99, 194)),
        useMaterial3: true,
      ),
      home: const MainView(title: 'Juego de Tronos'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key, required this.title});

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var characters = <Character>[];
  late Character randomCharacter;

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  getRequest() async {
    final response = await http.get(Uri.parse(
        "https://www.anapioficeandfire.com/api/characters?page=1&pageSize=30"));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      characters = result.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Error: No se pudo recibir la información de la API.');
    }
    setState(() {
      randomCharacter = getRandomCharacter();
    });
  }

  Character getRandomCharacter() {
    return characters[Random().nextInt(characters.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: characters.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: randomCharacter.getHousePrimaryColor(),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: randomCharacter.getHouseSecondaryColor(),
                          width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.star_border_outlined)),
                                Text(randomCharacter.getNumber(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))
                              ],
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(randomCharacter.getName(),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color:
                                          randomCharacter.getHouseFontColor())),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                    image: AssetImage(
                                        randomCharacter.getHouseIcon()),
                                    width: 30,
                                    height: 30),
                                Icon(randomCharacter.getGenderIcon())
                              ],
                            )
                          ])),
                ),
                GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: List.generate(characters.length, (index) {
                      return Card(
                          color: Colors.blue,
                          child: Center(
                            child: Text(characters[index].gender.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ));
                    }))
              ])),
      ),
    );
  }
}

//----------> Future Builder <----------
// Future<List<Character>> getCharactersFromAPI() async {
//   final url = Uri.parse(
//       "https://www.anapioficeandfire.com/api/characters?page=1&pageSize=30");
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     final List result = json.decode(response.body);
//     return characters = result.map((e) => Character.fromJson(e)).toList();
//   } else {
//     throw Exception('Error: No se pueo recibir la información de la API.');
//   }
// }
// FutureBuilder(
//     future: getCharactersFromAPI(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             children: List.generate(characters.length, (index) {
//               return Card(
//                   color: Colors.blue,
//                   child: Center(
//                     child: Text(characters[index].gender.toString(),
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineSmall),
//                   ));
//             }));
//       } else if (snapshot.hasError) {
//         return Text('${snapshot.error}');
//       }
//       return const CircularProgressIndicator();
//     }),
