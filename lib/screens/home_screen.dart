import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/fortune_card.dart';
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(colors: [Color(0xFF9c27b0), Color(0xFFe91e63)]),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('İyi akşamlar $_userName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          const Text('Bugün iç sesini dinlemeye ne dersin?', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
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
