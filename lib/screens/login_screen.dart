import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.stars, size: 80, color: Colors.purple),
                    SizedBox(height: 8),
                    Text(
                      'Astrofal',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text('Giriş yap'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text('Misafir girişi'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('E-posta ile kayıt ol'),
                ),
                if (Platform.isAndroid) ...[
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Gmail ile kayıt ol'),
                  ),
                ],
                if (Platform.isIOS) ...[
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('iCloud ile kayıt ol'),
                  ),
                ],
                const SizedBox(height: 24),
                const Disclaimer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
