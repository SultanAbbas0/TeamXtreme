import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;
  final double size;

  const ColoredCircle({super.key, required this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
