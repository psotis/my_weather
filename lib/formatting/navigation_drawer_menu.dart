import 'package:flutter/material.dart';
import 'package:my_weather/providers/auth/auth_provider.dart';
import 'package:my_weather/screens/favorites.dart';
import 'package:my_weather/screens/profile_screen.dart';
import 'package:my_weather/screens/setting_screen.dart';
import 'package:provider/provider.dart';

class NavigationDrawerMenu extends StatelessWidget {
  const NavigationDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      color: Colors.blue[300],
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
              'https://gettyimages.gr/wp-content/uploads/2021/08/asset-7.jpeg',
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'User',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            'E-mail',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Favorites'),
            leading: const Icon(Icons.favorite),
            onTap: () {
              Navigator.pushNamed(context, FavoritesScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: const Text('Log out'),
            leading: const Icon(Icons.logout),
            onTap: () {
              context.read<AuthProvider>().signout();
            },
          ),
        ],
      ),
    );
  }
}
