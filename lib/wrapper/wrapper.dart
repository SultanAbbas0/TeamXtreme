import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/event_schedule/views/events_view.dart';
import 'package:xtreme/home/views/home_screen_view.dart';
import 'package:xtreme/sign_in/providers/authentication_provider.dart';
import 'package:xtreme/sign_in/views/sign_in_view.dart';
import 'package:xtreme/wrapper/providers/bottom_sheet_provider.dart';

class Wrapper extends ConsumerStatefulWidget {
  Wrapper({super.key});

  @override
  ConsumerState<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  final List<Widget> _screens = [
    HomeScreen(),
    DetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ref.watch(userStream).when(
        data: (data) {
          if (data == null) return SignInView();
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