import 'package:flutter/material.dart';
import 'package:my_weather/screens/favorites.dart';
import 'package:my_weather/screens/profile_screen.dart';
import 'package:my_weather/screens/welcome_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, WelcomeScreen.routeName);
          },
          icon: const Icon(Icons.home),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          },
          icon: const Icon(Icons.person),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, FavoritesScreen.routeName);
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
