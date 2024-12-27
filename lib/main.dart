import 'package:flutter/material.dart';
import 'package:helep2/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helep2',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFC1A68B),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => const HomePage(),
      },
    );
  }
}
