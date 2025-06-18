import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';
import '../widgets/gradient_button.dart';
import 'coffee_fortune_screen.dart';
import 'tarot_fortune_screen.dart';
import 'numerology_fortune_screen.dart';
import 'question_fortune_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String _userName = 'Batıhan';

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
            _buildWelcome(),
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
            _buildExtras(),
            const SizedBox(height: 24),
            _buildEngagement(),
            const SizedBox(height: 24),
            _buildProfile(),
            const SizedBox(height: 24),
            _buildCommunity(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hoş geldin $_userName, Astrofal seni bekliyor!',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Bugün hislerini dinle ve iç sesine güven!',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildExtras() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExtraCard('Bugünün Falı', buttonText: 'Bugünün Falına Bak!'),
        _buildExtraCard('Günlük Astrolojik Rehber', content: 'Burcuna özel ipucu'),
        _buildExtraCard('Günün Şansı', content: 'Bugünün şanslı sayısı: 7'),
        _buildExtraCard('Günün Tarot Kartı', content: 'Kart yorumun burada'),
        _buildExtraCard('Haftanın En Güzel Fincanı', content: 'Haftanın vitrini'),
      ],
    );
  }

  Widget _buildEngagement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExtraCard('Haftalık Astro Quiz', content: 'Doğru cevapla rozet kazan'),
        _buildExtraCard('Astro Görevler', content: 'Bugün kahve falı baktır, ipucu kazan!'),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExtraCard('Fal Günlüğüm', content: 'Geçmiş fallarına ulaş'),
        _buildExtraCard('Fal Hatırlatıcısı', content: 'Bildirimlerini ayarla'),
      ],
    );
  }

  Widget _buildCommunity() {
    return _buildExtraCard('Astrofal Topluluğu', content: 'Yorumlarını paylaş');
  }

  Widget _buildExtraCard(String title, {String? content, String? buttonText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF9c27b0), Color(0xFFe91e63)],
        ),
        border: Border.all(color: Colors.white),
        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (content != null) ...[
            const SizedBox(height: 4),
            Text(content, style: const TextStyle(color: Colors.white70)),
          ],
          if (buttonText != null) ...[
            const SizedBox(height: 8),
            GradientButton(label: buttonText, onPressed: () {}),
          ],
        ],
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
