// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_weather/providers/weather_provider.dart';

// ignore: must_be_immutable
class TextFieldController extends StatefulWidget {
  const TextFieldController({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldController> createState() => TextFieldControllerState();
}

class TextFieldControllerState extends State<TextFieldController> {
  TextEditingController? city;
  String? cit;

  @override
  void initState() {
    city = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    city?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'City',
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.read<WeatherProvider>().getWeather(cit);
            },
            
          ),
        ),
        onChanged: (value) {
          setState(() {
            cit = city?.text;
          });
        },
        onSubmitted: (value) {
          context.read<WeatherProvider>().getWeather(cit);
        },
        controller: city,
      ),
    );
  }
}
