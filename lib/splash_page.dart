import 'package:flutter/material.dart';
import 'package:my_weather/providers/auth/auth_provider.dart';
import 'package:my_weather/providers/auth/auth_state.dart';
import 'package:my_weather/screens/login.dart';
import 'package:my_weather/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthProvider>().state;
    if (authState.authStatus == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushNamed(context, WelcomeScreen.routeName);
      });
    } else if (authState.authStatus == AuthStatus.unauthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushNamed(context, LoginPage.routeName);
      });
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
