import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';

class NumerologyFortuneScreen extends StatelessWidget {
  const NumerologyFortuneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numeroloji Falı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Kişisel bilgi girişi burada olacak.'),
            SizedBox(height: 20),
            Disclaimer(),
          ],
        ),
      ),
    );
  }
}
