import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/core/textfields/textfields.dart';

class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    const Text(
                      "Hi Sameer!",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                  child: Text(
                    DateTime.now().toIso8601String().split("T").first,
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
                RoundedTextField(
                  label: "Search",
                  borderColor: kWhite.withAlpha(100),
                  prefixWidget: Icon(Icons.search),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Container(
              color: Colors.grey[100],
            ),
          ))
        ],
      ),
    );
  }
}
