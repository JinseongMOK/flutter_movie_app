import 'package:flutter/material.dart';

Widget tag(String text) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      SizedBox(width: 8),
    ],
  );
}
