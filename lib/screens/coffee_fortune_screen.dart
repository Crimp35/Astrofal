import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';

class CoffeeFortuneScreen extends StatelessWidget {
  const CoffeeFortuneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahve Falı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Fotoğraf yükleme alanı burada olacak.'),
            SizedBox(height: 20),
            Disclaimer(),
          ],
        ),
      ),
    );
  }
}
