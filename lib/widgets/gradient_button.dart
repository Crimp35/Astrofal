import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color textColor;
  final Widget? icon;

  const GradientButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.gradient,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.icon,
  }) : super(key: key);

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
          decoration: BoxDecoration(
            gradient: widget.gradient ??
                const LinearGradient(colors: [Color(0xFF9c27b0), Color(0xFFe91e63)]),
            color: widget.gradient == null ? widget.backgroundColor : null,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onHighlightChanged: _handleHighlightChanged,
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      widget.icon!,
                      const SizedBox(width: 8),
                    ],
                    Text(widget.label,
                        style: TextStyle(color: widget.textColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
