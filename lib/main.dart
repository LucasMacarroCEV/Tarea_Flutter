import 'package:flutter/material.dart';

class Character {
  final String url, name, gender, culture, born, died, father, mother, spouse;
  final List<String> titles,
      aliases,
      allegiances,
      books,
      povBooks,
      tvSeries,
      playedBy;

  const Character({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
    required this.allegiances,
    required this.books,
    required this.povBooks,
    required this.tvSeries,
    required this.playedBy
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
    url: json['url'] as String, 
    name: json['name'] as String, 
    gender, 
    culture, 
    born, 
    died, 
    titles, 
    aliases, 
    father, 
    mother, 
    spouse, 
    allegiances, 
    books, 
    povBooks, 
    tvSeries, 
    playedBy)
  }
}

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(characters[index].name));
            },
            shrinkWrap: true,
          ),
          // GridView.count(
          //   crossAxisCount: 2,
          //   children: List.generate(100, (index) {
          //     return Center(
          //         child: Text(
          //       'Item $index',
          //       style: Theme.of(context).textTheme.headlineSmall,
          //     ));
          //   }),
          // )
        ],
      ),
    );
  }
}
