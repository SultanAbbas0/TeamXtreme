import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/core/constants/text_styles.dart';

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Settings',
                        style: h1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      child: Container(
                        color: Colors.grey[100],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
