import 'package:flutter/material.dart';
import '../widgets/disclaimer.dart';

class QuestionFortuneScreen extends StatelessWidget {
  const QuestionFortuneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soru-Cevap Falı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Soru giriş alanı burada olacak.'),
            SizedBox(height: 20),
            Disclaimer(),
          ],
        ),
      ),
    );
  }
}
