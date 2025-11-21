import 'package:flutter/material.dart';
import 'package:hubert_eat/views/main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Main());
  }
}
