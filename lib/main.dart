import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RapidAidApp());
}

class RapidAidApp extends StatelessWidget {
  const RapidAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RapidAid',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}