import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String? label;
  final Widget? child;
  final VoidCallback onPressed;
  const GradientButton({Key? key, this.label, this.child, required this.onPressed}) : super(key: key);

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _pressed = false;

  void _handleHighlightChanged(bool pressed) {
    setState(() => _pressed = pressed);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white),
        ),
        elevation: 4,
        shadowColor: Colors.black,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9c27b0), Color(0xFFe91e63)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onHighlightChanged: _handleHighlightChanged,
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              child: Center(
                child: widget.child ??
                    Text(widget.label ?? '',
                        style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
