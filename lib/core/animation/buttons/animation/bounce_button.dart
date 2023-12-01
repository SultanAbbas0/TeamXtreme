import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'constant/color.dart';
import 'constant/container.dart';
import 'on_click_bounce.dart';

class RoundedButton extends StatelessWidget {
  final Color? buttonColor;
  final String title;
  final double? titleSize;
  final Color titleColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final TextStyle? textStyle;
  final bool bounce;
  final bool isFilled;
  final bool dense;
  final void Function()? onTap;

  final double? width;

  const RoundedButton({
    this.buttonColor,
    required this.title,
    this.titleColor = Colors.white,
    this.onTap,
    this.margin,
    this.padding,
    this.titleSize,
    this.borderRadius,
    this.borderColor,
    this.height,
    this.isFilled = true,
    this.bounce = true,
    this.width,
    this.textStyle,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    return bounce
        ? OnClickScale(
            onTap: onTap,
            child: Container(
              height: height ?? kCardHeight,
              width: width ?? kCardWidth,
              alignment: Alignment.center,
              // margin: margin ?? (dense ? null : EdgeInsets.only(top: 10)),
              padding: padding ??
                  (dense ? null : EdgeInsets.symmetric(vertical: 10.0)),
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? kBorderRadius10,
                color: isFilled ? (buttonColor ?? primaryColor) : kTransparent,
                border: isFilled
                    ? null
                    : Border.all(
                        width: 1.5,
                        color: borderColor ?? accentColor,
                      ),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle ??
                    TextStyle(
                      fontSize: titleSize ?? 15,
                      color: titleColor,
                      height: 1.1,
                    ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height ?? kCardHeight,
              alignment: Alignment.center,
              margin: margin ?? (dense ? null : EdgeInsets.only(top: 10)),
              padding: padding ??
                  (dense ? null : EdgeInsets.symmetric(vertical: 10.0)),
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? kBorderRadius10,
                color: isFilled ? (buttonColor ?? kRed) : kTransparent,
                border: isFilled
                    ? null
                    : Border.all(
                        width: 1.5,
                        color: borderColor ?? kRed,
                      ),
              ),
              child: Text(
                title,
                style: textStyle ??
                    TextStyle(
                      fontSize: titleSize ?? 15,
                      color: titleColor,
                      height: 1.1,
                    ),
              ),
            ),
          );
  }
}
