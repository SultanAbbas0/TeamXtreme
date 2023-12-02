import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xFF1C1D22),
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFF25262D),
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        width: 200,
        height: 40,
        child: const Text(
          'Close',
          style: TextStyle(
            color: Color(0xFFF5F7F9),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
