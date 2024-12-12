import 'package:flutter/material.dart';
// import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_prectice_project/db_provider.dart';
import 'package:sqflite_prectice_project/home_screen_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (Context) => DBProvider(), child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter SQlite Demo",
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
        ),
      home: const MyHomePage(),
    );
  }
}

