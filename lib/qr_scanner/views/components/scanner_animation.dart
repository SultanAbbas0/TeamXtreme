import 'package:flutter/material.dart';

class ScannerAnimation extends AnimatedWidget {
  final double width;
  final double height;
  final double bottomOffset;
  final double scanningHeight;
  const ScannerAnimation({
    super.key,
    required this.width,
    required this.height,
    required this.bottomOffset,
    required this.scanningHeight,
    required super.listenable,
  });

  @override
  Widget build(BuildContext context) {
    final AnimationController animation = listenable as AnimationController;
    final scorePosition = (animation.value * scanningHeight) + bottomOffset;

    Radius bottomRadius = const Radius.circular(8);
    Radius topRadius = const Radius.circular(0);
    VerticalDirection verticalDirection = VerticalDirection.down;
    if (animation.status == AnimationStatus.reverse) {
      verticalDirection = VerticalDirection.up;
      topRadius = const Radius.circular(8);
      bottomRadius = const Radius.circular(0);
    }

    return Positioned(
      bottom: scorePosition.toDouble(),
      child: Column(
        verticalDirection: verticalDirection,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(60, 66, 202, 144),
                  Color(0xFF42CA90),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            width: width,
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(60, 66, 202, 144),
              borderRadius: BorderRadius.only(
                topLeft: topRadius,
                topRight: topRadius,
                bottomLeft: bottomRadius,
                bottomRight: bottomRadius,
              ),
            ),
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
