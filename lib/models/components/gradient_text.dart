import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    required this.gradient,
    required this.fontSize,
    required this.letterSpacing,
  });

  final String text;
  final Gradient gradient;
  final double fontSize;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTRB(0, bounds.bottom, 0, bounds.top),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          color: Colors.white,
          // fontWeight: FontWeight.w700,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.5, 1.5),
              blurRadius: 3.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
