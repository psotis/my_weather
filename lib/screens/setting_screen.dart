import 'package:flutter/material.dart';

import '../formatting/bottom_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is gonna be the settings screen'),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }
}
