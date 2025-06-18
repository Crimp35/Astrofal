import 'package:flutter/material.dart';
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
      body: ListView(
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
    );
  }

  Widget _buildFortuneButton(BuildContext context,
      {required String title,
      required String subtitle,
      required Widget screen}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
