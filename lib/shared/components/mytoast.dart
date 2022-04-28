import 'dart:ui';

import 'package:flutter/material.dart';

Widget show(String text, Color mycolor) {
  return Container(
    margin: const EdgeInsets.only(bottom: 25),
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: mycolor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.close,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget trueCheckShow(String text, Color myColor) {
  return Container(
    margin: const EdgeInsets.only(bottom: 25),
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
    decoration: BoxDecoration(
      border: BoxBorder.lerp(
          Border.all(
            color: const Color(0xff5C4DB1).withOpacity(0.4),
            style: BorderStyle.solid,
            
          ),
          Border.all(
            color: const Color(0xff5C4DB1).withOpacity(0.4),
            style: BorderStyle.solid,
          ),
          0.1),
      borderRadius: BorderRadius.circular(25.0),
      color: myColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check,
          color: Color(0xff5C4DB1),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: const TextStyle(color: Color(0xff5C4DB1)),
        ),
      ],
    ),
  );
}
