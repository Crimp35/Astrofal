import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/gradient_background.dart';
import 'coffee_fortune_screen.dart';
import 'tarot_fortune_screen.dart';
import 'numerology_fortune_screen.dart';
import 'question_fortune_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _userName = 'Batıhan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
              style: GoogleFonts.poppins(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 8),
                  _buildWelcomeSection(),
                  const SizedBox(height: 16),
                  _buildFortuneGrid(context),
                  const SizedBox(height: 16),
                  _buildDailyRow(),
                  const SizedBox(height: 16),
                  _buildActivityGrid(),
                  const SizedBox(height: 16),
                  _buildCommunityCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration({double radius = 20}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: const LinearGradient(
        colors: [Color(0xFF9c27b0), Color(0xFFe91e63)],
      ),
      border: Border.all(color: Colors.white),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 2)),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hoş geldin Batıhan 🌟',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Bugün hislerini dinle ve iç sesine güven!',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildFortuneGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _fortuneCard(
          context,
          title: 'Kahve Falı',
          subtitle: 'Fincanını yükle, gizemini keşfet!',
          screen: const CoffeeFortuneScreen(),
          icon: Icons.local_cafe,
        ),
        _fortuneCard(
          context,
          title: 'Tarot Falı',
          subtitle: 'Kartlarını seç, geleceğini gör!',
          screen: const TarotFortuneScreen(),
          icon: Icons.style,
        ),
        _fortuneCard(
          context,
          title: 'Numeroloji Falı',
          subtitle: 'Sayıların sırrını keşfet!',
          screen: const NumerologyFortuneScreen(),
          icon: Icons.numbers,
        ),
        _fortuneCard(
          context,
          title: 'Soru-Cevap Falı',
          subtitle: 'Kalbindekileri sor, Astrofal cevaplasın!',
          screen: const QuestionFortuneScreen(),
          icon: Icons.question_answer,
        ),
      ],
    );
  }

  Widget _fortuneCard(BuildContext context,
      {required String title,
      required String subtitle,
      required Widget screen,
      required IconData icon}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(_createRoute(screen)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _boxDecoration(radius: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyRow() {
    final cards = [
      _dailyCard('Bugünün Falı', 'Bugünün Falına Bak!', Icons.today),
      _dailyCard('Günlük Astro Rehber', 'Burcuna özel ipucu', Icons.wb_sunny),
      _dailyCard('Günün Şansı', 'Şanslı sayın: 7', Icons.star),
      _dailyCard('Günün Tarot Kartı', 'Kart yorumun burada', Icons.auto_awesome),
      _dailyCard('Haftanın En Güzel Fincanı', 'Haftanın vitrini', Icons.coffee),
    ];
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => cards[i],
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: cards.length,
      ),
    );
  }

  Widget _dailyCard(String title, String content, IconData icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildActivityGrid() {
    final activities = [
      _activityCard('Haftalık Astro Quiz', 'Doğru cevapla rozet kazan', Icons.quiz),
      _activityCard('Astro Görevler', 'Bugün kahve falı baktır, ipucu kazan!', Icons.task),
      _activityCard('Fal Günlüğüm', 'Geçmiş fallarına ulaş', Icons.book),
      _activityCard('Fal Hatırlatıcısı', 'Bildirimlerini ayarla', Icons.alarm),
    ];
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: activities,
    );
  }

  Widget _activityCard(String title, String content, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildCommunityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Astrofal Topluluğu', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(
            'Yorumlarını paylaş, diğer kullanıcılarla etkileşim kur.',
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
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
