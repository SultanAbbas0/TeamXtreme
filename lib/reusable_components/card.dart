import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/upcoming_events/models/course_event.dart';
import 'package:xtreme/upcoming_events/providers/courses_provider.dart';

class EventCard extends ConsumerWidget {
  final CourseEvent object;

  const EventCard(
      {super.key,
      required this.height,
      required this.color,
      required this.object});
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context, ref) {
    const style = TextStyle(fontSize: 15, color: Colors.white);
    final x = ref.watch(coursesProvider);
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Course: ${object.course}", style: style),
            Text("Material: ${object.material}", style: style),
            Text("Place: ${object.place}", style: style),
            Text("Category: ${object.category}", style: style)
          ]),
    );
  }
}
