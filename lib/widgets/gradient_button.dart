import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final VoidCallback onPressed;
  const GradientButton({Key? key, this.label, this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white),
        ),
        elevation: 4,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black,
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9c27b0), Color(0xFFe91e63)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          alignment: Alignment.center,
          child: child ?? Text(label ?? '', style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
