import 'package:flutter/material.dart';
import 'package:flutter_task/home_page.dart';
import 'package:flutter_task/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlutterTaskApp());
}

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => HomeProvider()..getCharacters(),
        child: const HomePage(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      // title: 'Tarea Flutter',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 71, 99, 194)),
      //   useMaterial3: true,
      // ),
      // home: ChangeNotifierProvider(
      //   create: (context) => HomeProvider()..getCharacters(),
      //   child: const HomePage(),
    );
  }
}
