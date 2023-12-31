import 'package:flutter/material.dart';

class followingClubsGrid extends StatefulWidget {
  const followingClubsGrid({super.key});

  @override
  State<followingClubsGrid> createState() => _followingClubsGridState();
}

class _followingClubsGridState extends State<followingClubsGrid> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Following Clubs Grid',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF007d40),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/ui/images/kfupm.png',
                        height: 60,
                        width: 80,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.green[500],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.grid_view_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Following Clubs Events',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey[100],
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: const MyGrid()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  final List<String> imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/xtreme-flutter-weekend.appspot.com/o/cc.png?alt=media&token=a5987727-b937-431b-b2e7-c164ffe9d08d',
    "https://firebasestorage.googleapis.com/v0/b/xtreme-flutter-weekend.appspot.com/o/gdc.png?alt=media&token=fca1d949-c283-49da-8069-f2c93d078546",
    "https://firebasestorage.googleapis.com/v0/b/xtreme-flutter-weekend.appspot.com/o/ie.png?alt=media&token=4a3daa74-7484-47f9-8cad-76250517472f",
    "https://firebasestorage.googleapis.com/v0/b/xtreme-flutter-weekend.appspot.com/o/MT7uSDg4_400x400-removebg-preview.png?alt=media&token=a6273115-f152-4b7a-be99-89b7f9fb38be",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              colors[index] = colors[index] == Colors.white
                  ? Colors.grey.shade200
                  : Colors.white;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors[index],
            ),
            height: 100,
            width: 100,
            child: Image.network(imageUrls[index]), // Use your image URLs here1
          ),
        );
      }),
    );
  }
}
