import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/reusable_components/colored_circle.dart';
import 'package:xtreme/reusable_components/expandable_container.dart';
import 'package:xtreme/upcoming_events/providers/card_id_provider.dart';
import 'package:xtreme/upcoming_events/providers/courses_provider.dart';

class UpcomingEvents extends ConsumerWidget {
  const UpcomingEvents({super.key});

  List<String> getNextfiveDays() {
    final List<String> nextSixDays = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < 5; i++) {
      final DateTime nextDay = now.add(Duration(days: i + 2));
      final String dayName = DateFormat('EEEE').format(nextDay);
      nextSixDays.add(dayName);
    }

    return nextSixDays;
  }

  Color getRandomColor() {
    Color randomColor;

    do {
      randomColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    } while (randomColor == Colors.white);

    return Colors.black;
  }

  @override
  Widget build(BuildContext context, ref) {
    List coloredCircles = [];
    List colors = [];
    final courses = ref.watch(coursesProvider);
    int eventsNumber = 0;

    DateTime now = DateTime.now();
    DateTime after1day = now.add(const Duration(days: 1));
    String today = DateFormat('EEEE').format(now);
    final String tomorrow = DateFormat('EEEE').format(after1day);
    final nextSixDays = getNextfiveDays();
    nextSixDays.insert(0, 'Today');
    nextSixDays.insert(1, 'Tomorrow');
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Events')),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return ExpandableRoundedContainer(
            nEvents: courses.when(
              data: (data) {
                if (nextSixDays[index] == "Today") {
                  eventsNumber = data[today]['count'];

                  return data[today]['count'];
                }
                if (nextSixDays[index] == "Tomorrow") {
                  eventsNumber = data[tomorrow]['count'];

                  return data[tomorrow]['count'];
                } else {
                  eventsNumber = data[nextSixDays[index]]['count'];

                  return data[nextSixDays[index]]['count'];
                }
              },
              error: (error, stackTrace) {
                debugPrint('error ${error.toString()}');
                return -2;
              },
              loading: () => -1,
            ),
            title: nextSixDays[index],
            id: index,
            cardProvider: cardIdProvider,
            courses: courses,
          );
        },
      ),
    );
  }
}
