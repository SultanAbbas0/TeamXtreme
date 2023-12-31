// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedCacheImage extends StatelessWidget {
  // The URL of the image to be displayed.
  String imgUr;
  // The width and height of the image. Default values are set to 80.
  double width;
  double height;
  RoundedCacheImage(
      {Key? key, required this.imgUr, this.width = 80, this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // Setting a border radius to create rounded corners.
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit
              .cover, // BoxFit.cover ensures the image covers the entire container.
          image: NetworkImage(
            imgUr, // fetch and display an image from the URL.
          ),
        ),
      ),
    );
  }
}
