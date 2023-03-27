import 'package:flutter/material.dart';
import 'package:my_weather/formatting/buttons.dart';
import 'package:my_weather/models/custom_errors.dart';
import 'package:my_weather/providers/signup_provider.dart';
import 'package:my_weather/providers/signup_state.dart';
import 'package:my_weather/screens/error_dialog.dart';
import 'package:my_weather/screens/login.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

TextEditingController? _usernameController;
TextEditingController? _emailController;
TextEditingController? _passwordController;
String? a;
String? b;
String? c;
const loginPageGif = 'assets/rain2.gif';

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  void _submit() async {
    try {
      print('email $b and password $c');
      context.read<SignupProvider>().signup(name: a!, email: b!, password: c!);
    } on CustomError catch (e) {
      errorDialog(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupState = context.watch<SignupProvider>().state;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade100,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginPageGif),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 100),
                    const Text(
                      'Welcome to My Weather',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                           label: Text(
                              'Enter Username',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          setState(() {
                            a = _usernameController?.text;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                           label: Text(
                              'Enter E-mail',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            b = _emailController?.text;
                            print('I am this username $b');
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                           label: Text(
                              'Enter Passowrd',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          setState(() {
                            c = _passwordController?.text;
                            print('I am this password $c');
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButtonAuthSplashScreen(
                        onPressed:
                            signupState.signupStatus == SignupStatus.submitting
                                ? null
                                : _submit,
                        text:
                            signupState.signupStatus == SignupStatus.submitting
                                ? 'Loading'
                                : 'Sign Up'),
                    SizedBox(
                      height: 20,
                    ),

                    CustomElevatedButtonAuthSplashScreen(
                      onPressed: () =>
                          Navigator.pushNamed(context, LoginPage.routeName),
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const WelcomeScreen())),
                      text: 'Log In',
                    ),
                    // loginButton(Navigator.pushNamed(context, LoginPage.routeName), Text('Log In'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
