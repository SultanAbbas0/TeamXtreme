import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/reusable_components/card.dart';
import 'package:xtreme/upcoming_events/providers/courses_provider.dart';

class EventCardsList extends ConsumerWidget {
  final colors;

  const EventCardsList({super.key, required this.list, required this.colors});
  final List<String> list;
  @override
  Widget build(BuildContext context, ref) {
    final x = ref.watch(coursesProvider);
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
                      child: x.when(
                        data: (data) {
                          final objects = data["Saturday"]["objects"];
                          return EventCard(
                            height: 100,
                            object: objects[list.indexOf(text)],
                            color: colors[list.indexOf(text)],
                          );
                        },
                        error: (error, stackTrace) => null,
                        loading: () => null,
                      )))
                  .toList(),
            ))
          ]),
    );
  }
}
