// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme/club_event/fetch_club_event.dart';
import 'package:xtreme/upcoming_events/models/fetch_course_event.dart';
import 'package:xtreme/event_schedule/views/events_view.dart';

import 'core/constants/colors.dart';
import 'home/views/home_screen_view.dart';
import 'wrapper/wrapper.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
///

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDqqC6er8Cmr2IFv9HlBihUOk66EQVWsW0",
      authDomain: "xtreme-flutter-weekend.firebaseapp.com",
      projectId: "xtreme-flutter-weekend",
      storageBucket: "xtreme-flutter-weekend.appspot.com",
      messagingSenderId: "825306918811",
      appId: "1:825306918811:web:9376181dd603f36cca7b3e",
    ),
  );
  SharedPreferences.setMockInitialValues({});

  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(
    child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'AR'),
        ],
        path: 'assets/language', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  ));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Wrapper();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // useMaterial3: true,
          colorScheme: const ColorScheme(
        brightness: Brightness.light,
        background: backgroundColor,
        onBackground: textColor,
        primary: primaryColor,
        onPrimary: primaryFgColor,
        secondary: kWhite,
        onSecondary: secondaryFgColor,
        tertiary: accentColor,
        onTertiary: accentFgColor,
        surface: backgroundColor,
        onSurface: textColor,
        error: Brightness.dark == Brightness.light
            ? Color(0xffB3261E)
            : Color(0xffF2B8B5),
        onError: Brightness.dark == Brightness.light
            ? Color(0xffFFFFFF)
            : Color(0xff601410),
      )),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: _router,
      builder: (BuildContext context, Widget? child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
    );
  }
}

/// The home screen

/// The details screen
