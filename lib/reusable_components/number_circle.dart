import 'package:flutter/material.dart';

class NumberCircle extends StatelessWidget {
  final int number;

  const NumberCircle({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
