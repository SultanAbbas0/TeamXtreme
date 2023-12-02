import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int numberOfItems = 5; //
  final List<String> quizesNames = [
    "Math 208 Assignment",
    "Phy 101 Assignment",
    "COE 202 Assignment",
    "COE 202 Assignment",
    "COE 202 Assignment",
  ];

  final String deadLine = "Wed, May 17, 11:59";

  int index = 0;

  static const String userName = "Sameer";
  static const String date = "12 Dec 2023 ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomNev(),
        backgroundColor: const Color(0xFF007d40),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/kfupm.png',
                        height: 60,
                        width: 80,
                        alignment: Alignment.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hi $userName",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ), //Text here is the name of the user
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
                      child: const Text(
                        date,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // Search Bar
                    SearchBar(),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Up coming Quizes/Assignments",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          padding: EdgeInsets.only(left: 10, right: 10),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      quizesNames[index],
                                      style: TextStyle(
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
                                      margin: EdgeInsets.all(10),
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(12),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  deadLine,
                                  style: TextStyle(
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
                          margin: EdgeInsets.only(left: 10, top: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
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
                                  margin: EdgeInsets.all(10),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.qr_code,
                                        color: Color(0xFF007d40),
                                        size: 60,
                                      ),
                                      Text(
                                        "QR Code",
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
                                  margin: EdgeInsets.all(10),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(
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
                                  margin: EdgeInsets.all(10),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Color(0xFF007d40),
                                        size: 60,
                                      ),
                                      Text(
                                        "Calender",
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
                                  margin: EdgeInsets.all(10),
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(
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
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Up coming Events",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        carouselSliderBuilder()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container SearchBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

BottomNavigationBar bottomNev() {
  return BottomNavigationBar(
    items: [
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
}

Widget carouselSliderBuilder() {
  return Expanded(
    child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2,
        autoPlay: true, // This is the key for automatic sliding
        autoPlayInterval: Duration(seconds: 5), // Time interval between slides
        enlargeCenterPage: true,
      ),
      items: [
        [
          "Free Niggas",
          "There are free  .................................",
          "https/nigga.com"
        ],
        [
          "Master Sameer",
          "There are free  .................................",
          "https/nigga.com"
        ],
        [
          "Mahmod",
          "There are free  .................................",
          "https/nigga.com"
        ],
        [
          "Sultan Abas",
          "There are free  .................................",
          "https/nigga.com"
        ],
        [
          "The winners",
          "There are free  .................................",
          "https/nigga.com"
        ]
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      i[0],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      i[1],
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => launch(i[2]),
                      child: Text(
                        i[2],
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
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
