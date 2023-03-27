import 'package:flutter/material.dart';

import '../formatting/bottom_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  static const String routeName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is gonna be the favorites screen'),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }
}
