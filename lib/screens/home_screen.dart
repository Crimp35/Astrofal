import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/fortune_card.dart';
import '../widgets/feature_card.dart';
import '../widgets/welcome_banner.dart';
import 'coffee_fortune_screen.dart';
import 'tarot_fortune_screen.dart';
import 'numerology_fortune_screen.dart';
import 'question_fortune_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _userName = 'Batıhan';
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFFFD700),
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Gelen Kutusu'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Topluluk'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTopNavigation(),
            const SizedBox(height: 12),
            _buildWelcomeSection(),
            const SizedBox(height: 16),
            _buildFortuneGrid(context),
            const SizedBox(height: 16),
            _buildFeatureGrid(),
            const SizedBox(height: 12),
            _buildShowMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.monetization_on, color: Colors.white),
          onPressed: () {},
        ),
        Text('Astrofal',
            style: GoogleFonts.poppins(
              color: const Color(0xFFFFD700),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return const WelcomeBanner(userName: _userName);
  }

  Widget _buildFortuneGrid(BuildContext context) {
    final cards = [
      FortuneCard(
        title: 'Kahve Falı',
        subtitle: 'Fincanını yükle!',
        imageUrl: 'https://via.placeholder.com/300x200?text=Kahve',
        onTap: () => Navigator.of(context).push(_createRoute(const CoffeeFortuneScreen())),
      ),
      FortuneCard(
        title: 'Tarot Falı',
        subtitle: 'Kart seç',
        imageUrl: 'https://via.placeholder.com/300x200?text=Tarot',
        onTap: () => Navigator.of(context).push(_createRoute(const TarotFortuneScreen())),
      ),
      FortuneCard(
        title: 'Numeroloji',
        subtitle: 'Doğum bilgilerini gir',
        imageUrl: 'https://via.placeholder.com/300x200?text=Numeroloji',
        onTap: () => Navigator.of(context).push(_createRoute(const NumerologyFortuneScreen())),
      ),
      FortuneCard(
        title: 'Soru-Cevap Falı',
        subtitle: 'Merak ettiğini sor',
        imageUrl: 'https://via.placeholder.com/300x200?text=Soru',
        onTap: () => Navigator.of(context).push(_createRoute(const QuestionFortuneScreen())),
      ),
    ];
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: cards,
    );
  }

  Widget _buildFeatureGrid() {
    const items = [
      ['Bugünün Falı', 'Günlük rastgele fal', 'https://via.placeholder.com/300?text=Daily'],
      ['Günlük Astro Rehber', 'Burçlara göre ipuçları', 'https://via.placeholder.com/300?text=Guide'],
      ['Günün Şansı', 'Şanslı sayı, renk', 'https://via.placeholder.com/300?text=Luck'],
      ['Günün Tarot Kartı', 'Bugüne özel kart', 'https://via.placeholder.com/300?text=Tarot'],
      ['Haftalık Astro Quiz', 'Quiz çöz, ödül kazan', 'https://via.placeholder.com/300?text=Quiz'],
      ['Astro Görevler', 'Görevleri tamamla', 'https://via.placeholder.com/300?text=Mission'],
      ['Fal Günlüğüm', 'Önceki fallar', 'https://via.placeholder.com/300?text=History'],
      ['Fal Hatırlatıcısı', 'Bildirimler', 'https://via.placeholder.com/300?text=Reminder'],
      ['Astrofal Topluluğu', 'Yorum paylaş', 'https://via.placeholder.com/300?text=Community'],
    ];
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var item in items)
          FeatureCard(
            title: item[0],
            subtitle: item[1],
            imageUrl: item[2],
            onTap: () {},
          ),
      ],
    );
  }

  Widget _buildShowMoreButton() {
    return TextButton(
      onPressed: () {},
      child: const Text('Daha Fazla Göster', style: TextStyle(color: Colors.white)),
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
