import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_weather/models/custom_errors.dart';

void errorDialog(BuildContext context, CustomError e) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(e.code),
          content: Text(e.plugin + '\n' + e.message),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.code),
            content: Text(e.plugin + '\n' + e.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          );
        });
  }
}
