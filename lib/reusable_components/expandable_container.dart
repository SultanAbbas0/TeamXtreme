import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/upcoming_events/providers/card_id_provider.dart';
import 'package:xtreme/reusable_components/events_list.dart';

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
  double? nEventsHeight = 30;
  late double widgetHeight;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      setState(() {
        widgetHeight = size.height;
      });
    });
  }

  Future<void> _toggleExpand() async {
    setState(() {
      isExpanded = !isExpanded;
      if (!isExpanded) {
        animatedContainerHeight = 0;
      } else {
        animatedContainerHeight = 30;
      }
    });
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      if (!isExpanded) {
        nEventsHeight = 30;
      } else {
        nEventsHeight = widgetHeight;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final x = ref.watch(widget.cardProvider);

    if (x != widget.id && isExpanded) {
      _toggleExpand();
    }
    return GestureDetector(
      onTap: () async {
        ref.read(widget.cardProvider.notifier).state = widget.id;
        await _toggleExpand();
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(23),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: animatedContainerHeight,
                ),
                if (!isExpanded)
                  AnimatedContainer(
                    margin: const EdgeInsets.only(top: 5),
                    duration: const Duration(milliseconds: 100),
                    alignment: Alignment.bottomLeft,
                    height: nEventsHeight == 30 ? 30 : nEventsHeight! / 2,
                    child: const Text("N events",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                if (isExpanded)
                  Builder(
                    builder: (BuildContext context) {
                      return EventsList(
                        events: const ["Google", "Hackathon", "Github"],
                        key: GlobalKey(),
                      );
                    },
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
    );
  }
}
