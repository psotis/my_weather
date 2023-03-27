// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

// ignore: must_be_immutable
class Circles extends StatefulWidget {
  String? cit;
  Circles({
    Key? key,
    this.cit,
  }) : super(key: key);

  @override
  State<Circles> createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF64b5f6),
            Color(0xFFf0f7f7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Positioned(
          //   top: 300,
          //   right: 250,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.favorite),
          //   ),
          // ),
          CircleAvatar(
            maxRadius: 60,
            minRadius: 40,
            backgroundColor: Colors.blueGrey,
            child: Text(
              '${context.watch<WeatherProvider>().weather?.name ?? ''}\n'
              '${context.watch<WeatherProvider>().weather?.sys?.country ?? ''}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF64b5f6),
                        Color(0xFFf0f7f7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(
                        // color: Colors.red,
                        ),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    '${context.watch<WeatherProvider>().weather?.main?.temp?.toInt() ?? ""}°C',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              // CircleAvatar(
              //   maxRadius: 40,
              //   minRadius: 30,
              //   backgroundColor: Colors.blueGrey,
              //   child: Text(
              //     '${context.watch<WeatherProvider>().weather?.main?.temp?.toInt() ?? ""}°C',
              //     style: const TextStyle(color: Colors.white),
              //   ),
              // ),
              CircleAvatar(
                maxRadius: 40,
                minRadius: 30,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  '${context.watch<WeatherProvider>().weather?.main?.humidity ?? ''} Hum',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
