import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/event_schedule/views/events_view.dart';
import 'package:xtreme/home/views/home_screen_view.dart';
import 'package:xtreme/qr_scanner/views/main_screen.dart';
import 'package:xtreme/upcoming_academics/views/main_screen.dart';
import 'package:xtreme/upcoming_events/views/main_screen.dart';
import 'package:xtreme/sign_in/providers/authentication_provider.dart';
import 'package:xtreme/sign_in/views/sign_in_view.dart';

import 'package:xtreme/wrapper/providers/bottom_sheet_provider.dart';

// stateful widget that allows the use of Riverpod for state management.
class Wrapper extends ConsumerStatefulWidget {
  Wrapper({super.key});

  @override
  ConsumerState<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  // A list of screens (widgets) that the app can display.
  final List<Widget> _screens = [
    const UpcomingEvents(),
    const UpcomingAcademics(),
    const ScannerScreen(),
    const HomeScreen(),
    const DetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BottomNavigationBar allows navigation between different screens.
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        return BottomNavigationBar(
          // updates the bottomBarProvider state, which holds the index of the current screen.
          onTap: (index) {
            ref.watch(bottomBarProvider.notifier).state = index;
          },
          // currentIndex is dynamically set based on the bottomBarProvider's state.
          currentIndex: ref.watch(bottomBarProvider),
          // Define items in the BottomNavigationBar with icons and labels.
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
              icon: Icon(Icons.abc_outlined),
              activeIcon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: "QR",
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
      // The body displays the current screen based on the bottomBarProvider's state.
      body: Consumer(builder: (context, ref, child) {
        return _screens[ref.watch(bottomBarProvider)];
      }),
    );
    // The userStream is watched, and the app's behavior changes based on the stream's output.
    return ref.watch(userStream).when(
        data: (data) {
          // If the user data is null, show the SignInView for user authentication.
          if (data == null) return SignInView();
          // Otherwise, display the main app structure with Scaffold.
          return Scaffold(
            backgroundColor: primaryColor,
            bottomNavigationBar: Consumer(builder: (context, ref, child) {
              return BottomNavigationBar(
                onTap: (index) {
                  ref.watch(bottomBarProvider.notifier).state = index;
                },
                currentIndex: ref.watch(bottomBarProvider),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Settings",
                  ),
                ],
              );
            }),
            body: Consumer(builder: (context, ref, child) {
              return _screens[ref.watch(bottomBarProvider)];
            }),
          );
        },
        error: ((error, stackTrace) => Text("Error")),
        loading: () => CircularProgressIndicator());
  }
}
