// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedCacheImage extends StatelessWidget {
  String imgUr;
  double width;
  double height;
  RoundedCacheImage({Key? key, required this.imgUr, this.width = 80, this.height = 80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imgUr,
          ),
        ),
      ),
    );
  }
}
