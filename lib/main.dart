import 'package:flutter/material.dart';
import 'package:flutter_task/CustomWidgets/navbar_custom.dart';

void main() {
  runApp(const FlutterTaskApp());
}

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tarea Flutter",
      home: const CustomBotNavBar(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
