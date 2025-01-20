import 'dart:convert';

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

  @override
  void initState() {
    super.initState();
  }

  Future<List<Character>> getCharactersFromAPI() async {
    final url = Uri.parse(
        "https://www.anapioficeandfire.com/api/characters?page=1&pageSize=15");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Error: No se pueo recibir la información de la API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Center(
          child: FutureBuilder(
              future: getCharactersFromAPI(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: snapshot.data!.length,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //         title: Text(snapshot.data![index].gender.toString()));
                  //   },
                  // );
                  return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(snapshot.data!.length, (index) {
                        return Center(
                          child: Text(snapshot.data![index].gender.toString(),
                              style: Theme.of(context).textTheme.headlineSmall),
                        );
                      }));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }))
    ]));
  }
}
