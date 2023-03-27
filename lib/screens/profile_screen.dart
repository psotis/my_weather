import 'package:flutter/material.dart';

import '../formatting/bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is gonna be the profile screen'),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }
}
