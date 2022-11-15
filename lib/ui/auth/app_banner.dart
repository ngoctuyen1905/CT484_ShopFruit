import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 94.0,
      ),
      // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.deepOrange.shade900,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Color.fromARGB(66, 235, 235, 235),
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Text(
        'MyFruit',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 100,
          fontFamily: 'Glorious',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
