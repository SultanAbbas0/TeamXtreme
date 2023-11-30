import 'package:flutter/material.dart';

/// Shimmer Effect is used for loading the widget in an attractive form
class Shimmer extends StatefulWidget {
  final Widget child, placeholder;
  final bool isLoading;
  final Duration? duration;

  const Shimmer({Key? key, required this.child, required this.isLoading, required this.placeholder, this.duration})
      : super(key: key);

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..forward()
      ..repeat(reverse: true);
    animation = Tween(begin: 1.0, end: 0.2).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: widget.duration ?? Duration(milliseconds: 300),
      crossFadeState: (widget.isLoading) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: FadeTransition(
        opacity: animation as Animation<double>,
        child: widget.placeholder,
      ),
      secondChild: Builder(builder: (context) {
        if (!widget.isLoading) controller.stop();
        return widget.child;
      }),
      layoutBuilder: (child1, key1, child2, key2) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [child1, child2],
        );
      },
    );
  }
}

class PlaceHolderContainer extends StatelessWidget {
  // * expanded will cause height/width to be null => container will take as much space as possible
  final bool expanded;
  final EdgeInsetsGeometry? margin;
  final double? height, width;
  final bool isRounded;
  final BoxDecoration? boxDecoration;
  const PlaceHolderContainer(
      {Key? key,
      this.height,
      this.width,
      this.isRounded = true,
      this.margin,
      this.boxDecoration,
      this.expanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: expanded ? null : width ?? MediaQuery.of(context).size.width * 0.4,
      height: expanded ? null : height ?? MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: boxDecoration?.color ?? Colors.grey[300],
        shape: boxDecoration?.shape ?? BoxShape.rectangle,
        border: boxDecoration?.border,
        boxShadow: boxDecoration?.boxShadow,
        image: boxDecoration?.image,
        backgroundBlendMode: boxDecoration?.backgroundBlendMode,
        gradient: boxDecoration?.gradient,
        borderRadius:
            boxDecoration?.shape == BoxShape.circle ? null : boxDecoration?.borderRadius ?? BorderRadius.circular(15),
      ),
    );
  }
}
