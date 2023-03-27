// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomElevatedButtonAuthSplashScreen extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const CustomElevatedButtonAuthSplashScreen({
    Key? key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: [Colors.blue, Colors.transparent]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 120,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              '$text',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
