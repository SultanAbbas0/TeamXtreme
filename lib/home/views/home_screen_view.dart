import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart' as intl;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:xtreme/core/animation/shimmer.dart';
import 'package:xtreme/home/provider/home_view_provider.dart';

import 'package:xtreme/sign_in/providers/authentication_provider.dart';
// import 'package:TeamXtreme/lib/home/views/carsouelContainers.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:xtreme/wrapper/providers/bottom_sheet_provider.dart';

import '../../news/models/news.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final int numberOfItems = 5; //
  final List<String> quizesNames = [
    "MATH102 Second Major",
  ];

  final String deadLine = "Tomorrow 11:59";

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF007d40),
          body: SafeArea(
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/ui/images/kfupm.png',
                              height: 60,
                              width: 80,
                              alignment: Alignment.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ref.watch(fireuserStream).when(
                                  data: (data) {
                                    if (data == null) return const Text("Hi");
                                    return Text(
                                      "Hi, " + data.firstName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    );
                                  },
                                  error: (e, s) {
                                    return Text(
                                      e.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    );
                                  },
                                  loading: () => const Shimmer(
                                      isLoading: true,
                                      placeholder: SizedBox(
                                        height: 20,
                                        width: 100,
                                      ),
                                      child: SizedBox(
                                        height: 20,
                                        width: 100,
                                      ))),
                              //Text here is the name of the user
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green[500],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateTime.now().toString().substring(0, 10),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // Search Bar
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey[100],
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Upcoming Assignments/Majors",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          quizesNames[index],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            index++;
                                            if (index == numberOfItems) {
                                              index = 0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          margin: const EdgeInsets.all(10),
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      deadLine,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 20),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Academic Tools",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // QR Code
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          ref
                                              .watch(bottomBarProvider.notifier)
                                              .state = 1;
                                        },
                                        child: const Column(
                                          children: [
                                            Icon(
                                              Icons.qr_code,
                                              color: Color(0xFF007d40),
                                              size: 60,
                                            ),
                                            Text(
                                              "Attendance",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // QR Code
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Column(
                                        children: [
                                          Icon(
                                            Icons.school_rounded,
                                            color: Color(0xFF007d40),
                                            size: 60,
                                          ),
                                          Text(
                                            "Transcript",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // QR Code
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          launchUrl(
                                              Uri.parse(
                                                  'https://registrar.kfupm.edu.sa/academic-calendar/current-academic-year/'),
                                              mode: LaunchMode.platformDefault);
                                        },
                                        child: const Column(
                                          children: [
                                            Icon(
                                              Icons.calendar_month_outlined,
                                              color: Color(0xFF007d40),
                                              size: 60,
                                            ),
                                            Text(
                                              "Calendar",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // QR Code
                                      });
                                    },
                                    child: Container(
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Column(
                                        children: [
                                          Icon(
                                            Icons.menu_book_rounded,
                                            color: Color(0xFF007d40),
                                            size: 60,
                                          ),
                                          Text(
                                            "Courses",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(bottom: 10, left: 10),
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     "Up coming Events",
                            //     style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            // Expanded(
                            //   child: CarouselSlider(
                            //     options: CarouselOptions(
                            //       aspectRatio: 2,
                            //       autoPlay:
                            //           true, // This is the key for automatic sliding
                            //       autoPlayInterval: Duration(
                            //           seconds:
                            //               5), // Time interval between slides
                            //       enlargeCenterPage: true,
                            //     ),
                            //     items: [
                            //       "Free Niggas",
                            //       "Master Sameer",
                            //       "Mahmod",
                            //       "Sultan Abas",
                            //       "The winners"
                            //     ].map((i) {
                            //       return Builder(
                            //         builder: (BuildContext context) {
                            //           return Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             padding: EdgeInsets.only(
                            //                 left: 50, right: 50),
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius:
                            //                   BorderRadius.circular(12),
                            //             ),
                            //             alignment: Alignment.centerLeft,
                            //             child: Text(
                            //               'text $i',
                            //               style: TextStyle(
                            //                   fontSize: 20.0,
                            //                   fontWeight: FontWeight.bold),
                            //             ),
                            //           );
                            //         },
                            //       );
                            //     }).toList(),
                            //   ),
                            // ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "News",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ref.watch(newsProvider).when(
                                data: (news) {
                                  return carouselSliderBuilder(news);
                                },
                                loading: () =>
                                    const CircularProgressIndicator(),
                                error: (error, stack) => Text(error.toString()))
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  Widget carouselSliderBuilder(List<News> news) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2,
          autoPlay: true, // This is the key for automatic sliding
          autoPlayInterval:
              const Duration(seconds: 5), // Time interval between slides
          enlargeCenterPage: true,
        ),
        items: news.map((i) {
          return Consumer(
            builder: (BuildContext context, ref, child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/ui/images/kfupm.png",
                        width: 35,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          i.content,
                          style: const TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => launch(i.twitter),
                        child: const Text(
                          "Link to Twitter",
                          style: TextStyle(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
