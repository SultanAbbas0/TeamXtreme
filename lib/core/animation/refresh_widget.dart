import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  Function() onTap;
  Color color;
  double size;
  RefreshWidget(
      {super.key,
      required this.onTap,
      this.color = Colors.cyan,
      this.size = 25});

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          turns += 1;

          widget.onTap();
        });
      },
      child: AnimatedRotation(
        duration: Duration(milliseconds: 400),
        turns: turns,
        child: Icon(
          Icons.refresh,
          color: widget.color,
          size: widget.size,
        ),
      ),
    );
  }
}
