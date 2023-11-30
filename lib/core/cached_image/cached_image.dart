// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../animation/shimmer.dart';

class CachedImage extends StatefulWidget {
  String imgUrl;
  double? width;
  double? height;
  CachedImage({
    Key? key,
    required this.imgUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widget.width,
      height: widget.height,
      imageUrl: widget.imgUrl,
      errorWidget: (context, url, error) {
        return PlaceHolderContainer();
      },
      placeholder: (context, url) {
        return PlaceHolderContainer();
      },
    );
  }
}
