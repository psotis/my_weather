import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/providers/auth/auth_provider.dart';
import 'package:my_weather/providers/auth/auth_state.dart';
import 'package:my_weather/providers/login_provider.dart';
import 'package:my_weather/providers/signup_provider.dart';
import 'package:my_weather/providers/weather_provider.dart';
import 'package:my_weather/repositories/auth_repository.dart';
import 'package:my_weather/screens/favorites.dart';
import 'package:my_weather/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:my_weather/screens/profile_screen.dart';
import 'package:my_weather/screens/setting_screen.dart';
import 'package:my_weather/screens/sign_up_screen.dart';
import 'package:my_weather/screens/welcome_screen.dart';
import 'package:my_weather/splash_page.dart';
import 'package:provider/provider.dart';

// import 'themes/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
          create: (_) => WeatherProvider(),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseFirestore: FirebaseFirestore.instance,
            firebaseAuth: fbAuth.FirebaseAuth.instance,
          ),
        ),
        StreamProvider<fbAuth.User?>(
          create: (context) => context.read<AuthRepository>().user,
          initialData: null,
        ),
        ChangeNotifierProxyProvider<fbAuth.User?, AuthProvider>(
          create: (context) => AuthProvider(
            authRepository: context.read<AuthRepository>(),
          ),
          update: (BuildContext context, fbAuth.User? userStream,
                  AuthProvider? authProvider) =>
              authProvider!..update(userStream),
        ),
        ChangeNotifierProvider<SigninProvider>(
          create: (context) => SigninProvider(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'My Weather',
        home: SplashPage(),
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          WelcomeScreen.routeName:(context) => WelcomeScreen(),
          FavoritesScreen.routeName: (context) => FavoritesScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthProvider>().state;

    if (authState.authStatus == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      });
    } else if (authState.authStatus == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ),
        );
      });
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
