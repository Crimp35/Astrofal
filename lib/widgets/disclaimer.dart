import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Bu uygulamadaki fal yorumlari eglence amaclidir ve gercek disi veya'
        ' profesyonel tavsiye niteliginde degildir. Alinan kararlardan '
        'kullanici sorumludur. Gerekli durumlarda profesyonel destek almanizi '
        'oneririz.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 11, color: Colors.white60),
      ),
    );
  }
}
