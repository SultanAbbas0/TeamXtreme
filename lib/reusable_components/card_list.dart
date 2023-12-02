import 'package:flutter/material.dart';
import 'package:xtreme/reusable_components/card.dart';

class EventCardsList extends StatelessWidget {
  const EventCardsList({super.key, required this.list});
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
                        child: const EventCard(
                          height: 40,
                          color: Colors.red,
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
