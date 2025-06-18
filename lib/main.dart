import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AstrofalApp());
}

class AstrofalApp extends StatelessWidget {
  const AstrofalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark();
    return MaterialApp(
      title: 'Astrofal',
      theme: base.copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.nunitoTextTheme(base.textTheme).apply(bodyColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Colors.white),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 4,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
