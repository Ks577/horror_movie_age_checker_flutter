import 'package:flutter/material.dart';

Widget customCard({required child}) {
  return Card(
    elevation: 5,
    shadowColor: Colors.orange[300],
    color: Colors.black38,
    child: SizedBox(width: 300, height: 200, child: child),
  );
}
