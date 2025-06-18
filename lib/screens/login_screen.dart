import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';
import '../widgets/gradient_background.dart';
import '../widgets/gradient_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientBackground(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.stars, size: 80, color: Colors.pinkAccent),
                      SizedBox(height: 8),
                      Text(
                        'Astrofal',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GradientButton(
                    label: 'Giriş yap',
                    onPressed: () {
                      Navigator.of(context)
                          .push(_createRoute(const HomeScreen()));
                    },
                  ),
                  const SizedBox(height: 8),
                  GradientButton(
                    label: 'Misafir girişi',
                    onPressed: () {
                      Navigator.of(context)
                          .push(_createRoute(const HomeScreen()));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),
                  GradientButton(
                    label: 'E-posta ile kayıt ol',
                    gradient: null,
                    backgroundColor: Colors.white,
                    textColor: const Color(0xFF9c27b0),
                    icon: const Icon(Icons.mail_outline, color: Color(0xFF9c27b0)),
                    onPressed: () {},
                  ),
                  if (Platform.isAndroid) ...[
                    const SizedBox(height: 8),
                    GradientButton(
                      label: 'Google ile Kayıt Ol',
                      gradient: null,
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      icon: const Icon(Icons.android, color: Colors.blue),
                      onPressed: () {},
                    ),
                  ],
                  if (Platform.isIOS) ...[
                    const SizedBox(height: 8),
                    GradientButton(
                      label: 'Apple ile devam et',
                      gradient: null,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      icon: const Icon(Icons.apple, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                  const SizedBox(height: 24),
                  const Disclaimer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
