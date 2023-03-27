import 'package:flutter/material.dart';
import 'package:my_weather/formatting/buttons.dart';
import 'package:my_weather/models/custom_errors.dart';
import 'package:my_weather/providers/login_provider.dart';
import 'package:my_weather/providers/login_state.dart';
import 'package:my_weather/screens/error_dialog.dart';
import 'package:my_weather/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController? _emailController;
TextEditingController? _passwordController;

String? b;
String? c;
const loginPageGif = 'assets/rain2.gif';

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  void _submit() async {
    // final form = _formKey.currentState;
    // if (form == null || !form.validate()) return;
    try {
      print('email $b and password $c');
      context.read<SigninProvider>().signin(email: b!, password: c!);
    } on CustomError catch (e) {
      errorDialog(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signinState = context.watch<SigninProvider>().state;
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
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
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email required';
                            }
                            if (!isEmail(value.trim())) {
                              return 'Enter valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? value) {
                            b = value;
                          },
                          onChanged: (value) {
                            setState(() {
                              b = _emailController?.text;
                              print('I am this username $b');
                            });
                          },
                          controller: _emailController,
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
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password required';
                            }
                            if (!isEmail(value.trim())) {
                              return 'Enter password above 6 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          onSaved: (String? value) {
                            c = value;
                          },
                          onChanged: (value) {
                            setState(() {
                              c = _passwordController?.text;
                              print('I am this password $c');
                            });
                          },
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButtonAuthSplashScreen(
                        onPressed:
                            signinState.signinStatus == SigninStatus.submitting
                                ? null
                                : _submit,
                        text:
                            signinState.signinStatus == SigninStatus.submitting
                                ? 'Loading...'
                                : 'Log in',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButtonAuthSplashScreen(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.routeName);
                        },
                        text: 'Sign Up',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
