import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';

class TarotFortuneScreen extends StatelessWidget {
  const TarotFortuneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarot Falı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Kart seçme alanı burada olacak.'),
            SizedBox(height: 20),
            Disclaimer(),
          ],
        ),
      ),
    );
  }
}
