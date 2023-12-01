import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/event_schedule/views/events_view.dart';
import 'package:xtreme/home/views/home_screen_view.dart';
import 'package:xtreme/upcoming_academics/views/main_screen.dart';
import 'package:xtreme/upcoming_events/views/main_screen.dart';
import 'package:xtreme/wrapper/providers/bottom_sheet_provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  final List<Widget> _screens = [
    const UpcomingEvents(),
    const UpcomingAcademics(),
    const HomeScreen(),
    const DetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        return BottomNavigationBar(
          onTap: (index) {
            ref.watch(bottomBarProvider.notifier).state = index;
          },
          currentIndex: ref.watch(bottomBarProvider),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined),
              activeIcon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: "academics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: "Events",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: "Settings",
            ),
          ],
        );
      }),
      body: Consumer(builder: (context, ref, child) {
        return _screens[ref.watch(bottomBarProvider)];
      }),
    );
  }
}
