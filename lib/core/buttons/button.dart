import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class Button extends StatefulWidget {
  final String text;
  final Function() onPress;
  // Default values are set to 60.
  final double height;
  // Default values are set to 150.
  final double width;
  final Color? color;

  Button(
      {Key? key,
      required this.onPress,
      required this.text,
      this.height = 60,
      this.width = 150,
      this.color})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        primary: widget.color ?? secondaryColor,
        minimumSize: Size(widget.width, widget.height),
      ),
      onPressed: widget.onPress,
      child: Text(
        widget.text,
        style: t1,
      ),
    );
  }
}
