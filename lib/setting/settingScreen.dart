import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                            margin: EdgeInsets.only(right: 10),
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
                          Text(
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Themes',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MyRadioButtons(),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF007d40),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Log Out",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
          activeColor: Color(0xFF007d40),
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
          activeColor: Color(0xFF007d40),
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
