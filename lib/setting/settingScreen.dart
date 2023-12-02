import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/sign_in/providers/authentication_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return MaterialApp(
      title: 'Setting',
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
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Setting',
                            style: TextStyle(
                              fontSize: 30,
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
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Themes',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Dark Mode',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              Switch(
                                inactiveTrackColor: Colors.grey[400],
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    if (isSwitched == false) {
                                      isSwitched = true;
                                    } else {
                                      isSwitched = false;
                                    }
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const MyRadioButtons(),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF007d40),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ref.watch(authProvider).signOut();
                            },
                            child: const Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
}

class MyRadioButtons extends StatefulWidget {
  const MyRadioButtons({super.key});

  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  String _selectedLanguage = 'English'; // English is selected by default

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('English'),
          value: 'English',
          activeColor: const Color(0xFF007d40),
          groupValue: _selectedLanguage,
          onChanged: (String? value) {
            setState(() {
              _selectedLanguage = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Arabic'),
          value: 'Arabic',
          groupValue: _selectedLanguage,
          activeColor: const Color(0xFF007d40),
          onChanged: (String? value) {
            setState(() {
              _selectedLanguage = value!;
            });
          },
        ),
      ],
    );
  }
}
