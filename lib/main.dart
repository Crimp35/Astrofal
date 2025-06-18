import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AstrofalApp());
}

class AstrofalApp extends StatelessWidget {
  const AstrofalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrofal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
