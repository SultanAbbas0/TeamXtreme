import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xtreme/reusable_components/expandable_container.dart';
import 'package:xtreme/upcoming_academics/providers/card_id_provider.dart';

class UpcomingAcademics extends StatelessWidget {
  const UpcomingAcademics({super.key});

  /// generates a list of the next six days, starting from today.
  List<String> getNextSixDays() {
    final List<String> nextSixDays = [];
    final DateTime now = DateTime.now();

    // Loop to calculate the next six days from the current date.
    for (int i = 0; i < 5; i++) {
      final DateTime nextDay = now.add(Duration(days: i + 2));
      final String dayName = DateFormat('EEEE').format(nextDay);
      nextSixDays.add(dayName);
    }

    return nextSixDays;
  }

  @override
  Widget build(BuildContext context) {
    final nextSixDays = getNextSixDays();
    nextSixDays.insert(0, 'Today');
    nextSixDays.insert(1, 'Tomorrow');
    return Scaffold(
      // AppBar at the top of the app with a title.
      appBar: AppBar(title: const Text('Upcoming Academics')),
      body: ListView.builder(
        itemCount:
            7, // There are seven items in the list including 'Today' and 'Tomorrow'.
        itemBuilder: (BuildContext context, int index) {
          return ExpandableRoundedContainer(
            title:
                nextSixDays[index], // Set the title to the corresponding day.
            text:
                "hi", // Placeholder text, it will replaced with actual event details.
            id: index,
            cardProvider:
                cardIdProvider, // Provider for managing state related to card IDs.
          );
        },
      ),
    );
  }
}
