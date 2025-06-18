import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';
import '../widgets/gradient_button.dart';
import 'coffee_fortune_screen.dart';
import 'tarot_fortune_screen.dart';
import 'numerology_fortune_screen.dart';
import 'question_fortune_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astrofal'),
      ),
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
          _buildFortuneButton(
            context,
            title: 'Kahve Falı',
            subtitle: 'Fincanını yükle, gizemini keşfet!',
            screen: const CoffeeFortuneScreen(),
          ),
          _buildFortuneButton(
            context,
            title: 'Tarot Falı',
            subtitle: 'Kartlarını seç, geleceğini gör!',
            screen: const TarotFortuneScreen(),
          ),
          _buildFortuneButton(
            context,
            title: 'Numeroloji Falı',
            subtitle: 'Sayıların sırrını keşfet!',
            screen: const NumerologyFortuneScreen(),
          ),
          _buildFortuneButton(
            context,
            title: 'Soru-Cevap Falı',
            subtitle: 'Kalbindekileri sor, Astrofal cevaplasın!',
            screen: const QuestionFortuneScreen(),
          ),
        ],
      ),
    ),
  );
  }

  Widget _buildFortuneButton(BuildContext context,
      {required String title,
      required String subtitle,
      required Widget screen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GradientButton(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(_createRoute(screen));
        },
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
