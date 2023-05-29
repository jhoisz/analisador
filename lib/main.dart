import 'package:analisador/screens/home.dart';
import 'package:analisador/screens/result_page.dart';
import 'package:analisador/theme/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/result': (context) => const ResultPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Analisador - Compiladores',
      theme: myTheme,
      home: const Home(),
    );
  }
}
