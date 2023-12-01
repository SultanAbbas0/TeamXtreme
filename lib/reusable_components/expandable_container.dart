import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/reusable_components/card_list.dart';

class ExpandableRoundedContainer extends ConsumerStatefulWidget {
  final String title;
  final String text;
  final int id;
  final cardProvider;

  const ExpandableRoundedContainer({
    Key? key,
    required this.title,
    required this.id,
    required this.text,
    required this.cardProvider,
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
                          child: const Text(
                            "N events",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
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
            const EventCardsList(
              list: ["1", "2", "3"],
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
