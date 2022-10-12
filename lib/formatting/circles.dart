import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
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
      // width: 100,
      // height: 100,
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   color: Colors.white,
      //   border: Border.all(width: 1, color: Colors.black38),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            maxRadius: 60,
            minRadius: 40,
            backgroundColor: Colors.blueGrey,
            child: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              CircleAvatar(
                maxRadius: 40,
                minRadius: 30,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  'Temp',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CircleAvatar(
                maxRadius: 40,
                minRadius: 30,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  'Humidity',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
