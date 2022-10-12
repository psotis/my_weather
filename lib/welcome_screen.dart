import 'package:flutter/material.dart';
import 'package:my_weather/formatting/navigation_drawer_menu.dart';
import 'package:my_weather/my_search.dart';
import 'package:my_weather/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'formatting/bottom_bar.dart';
import 'formatting/circles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF64B5F6),
        title: const Text(
          'My Weather',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Dark Mode',
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: const Icon(Icons.brightness_6_outlined),
                color: Colors.white,
                onPressed: () {
                  ThemeProvider themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  themeProvider.swapTheme();
                },
              ),
              IconButton(
                onPressed: () {showSearch(context: context, delegate: MySearchDelegate());},
                icon: const Icon(Icons.search),
              ),
            ],
          )
        ],
      ),
      body: const Circles(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
