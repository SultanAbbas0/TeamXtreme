import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/reusable_components/card_list.dart';
import 'package:xtreme/reusable_components/colored_circle.dart';
import 'package:xtreme/reusable_components/number_circle.dart';
import 'dart:math';

class ExpandableRoundedContainer extends ConsumerStatefulWidget {
  final String title;
  final int nEvents;
  final int id;
  final courses;
  final cardProvider;

  const ExpandableRoundedContainer({
    Key? key,
    required this.title,
    required this.nEvents,
    required this.id,
    required this.cardProvider,
    required this.courses,
  }) : super(key: key);

  @override
  ExpandableRoundedContainerState createState() =>
      ExpandableRoundedContainerState();
}

class ExpandableRoundedContainerState
    extends ConsumerState<ExpandableRoundedContainer> {
  bool isExpanded = false;
  double animatedContainerHeight = 0;
  double animatedContainerHeight2 = 120;
  bool enteredScreen = true;
  Future<void> _toggleExpand() async {
    setState(() {
      enteredScreen = false;
      isExpanded = !isExpanded;
      if (!isExpanded) {
        animatedContainerHeight = 0;
        animatedContainerHeight2 = 120;
      } else {
        animatedContainerHeight = 15;
        animatedContainerHeight2 = 80;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var random = Random(50);

    Color getRandomColor() {
      Color randomColor;

      do {
        randomColor = Color.fromARGB(
          255,
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
        );
      } while (randomColor == Colors.white);

      return randomColor;
    }

    List coloredCircles = [];
    List colors = [];
    for (var i = 0; i < widget.nEvents; i++) {
      final color = getRandomColor();
      coloredCircles.add(ColoredCircle(color: color));
      colors.add(color);
    }
    random = Random(50);
    final x = ref.watch(widget.cardProvider);

    if (x != widget.id && isExpanded) {
      _toggleExpand();
    }
    return Container(
      constraints: const BoxConstraints.tightForFinite(),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              ref.read(widget.cardProvider.notifier).state = widget.id;
              await _toggleExpand();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(16),
              height: animatedContainerHeight2,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (!isExpanded)
                        DelayedWidget(
                          enteredScreen: enteredScreen,
                          delay: const Duration(milliseconds: 100),
                          child: Row(children: [
                            NumberCircle(number: widget.nEvents),
                            const SizedBox(
                              width: 10,
                            ),
                            ...coloredCircles
                          ]),
                        )
                    ],
                  ),
                  if (!isExpanded)
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  if (isExpanded)
                    const Icon(
                      Icons.arrow_drop_up,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: animatedContainerHeight,
          ),
          if (isExpanded)
            EventCardsList(
              colors: colors,
              list: const ['1', '2', '3', '4'],
            ),
        ],
      ),
    );
  }
}

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final bool enteredScreen;
  const DelayedWidget({
    Key? key,
    required this.child,
    required this.delay,
    required this.enteredScreen,
  }) : super(key: key);

  @override
  _DelayedWidgetState createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
    if (widget.enteredScreen) {
      visible = true;
    } else {
      Future.delayed(widget.delay, () {
        setState(() {
          visible = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: visible ? widget.child : null,
    );
  }
}
