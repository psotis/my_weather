import 'package:flutter/material.dart';
import 'package:my_weather/formatting/navigation_drawer_menu.dart';
import 'package:my_weather/formatting/text_editing_controller.dart';

import '../formatting/bottom_bar.dart';
import '../formatting/circles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF64B5F6),
        title: const Text(
          'My Weather',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
              // const Text(
              //   'Dark Mode',
              //   textAlign: TextAlign.center,
              // ),
              // IconButton(
              //   icon: const Icon(Icons.brightness_6_outlined),
              //   color: Colors.white,
              //   onPressed: () {
              //     ThemeProvider themeProvider =
              //         Provider.of<ThemeProvider>(context, listen: false);
              //     themeProvider.swapTheme();
              //   },
              // ),
              TextFieldController()
            ],
          )
        ],
      ),
      body: Circles(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
