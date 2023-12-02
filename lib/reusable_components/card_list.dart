import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/reusable_components/card.dart';

class EventCardsList extends StatelessWidget {
  final colors;

  const EventCardsList({super.key, required this.list, required this.colors});
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              width: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              children: list
                  .map((text) => Container(
                        margin: EdgeInsets.only(
                            bottom:
                                list.indexOf(text) == list.length - 1 ? 0 : 16),
                        child: EventCard(
                          height: 40,
                          color: colors[list.indexOf(text)],
                        ),
                      ))
                  .toList(),
            ))
          ]),
    );
  }
}
