import 'package:flutter/material.dart';

Widget customTextField({
  required void Function(String value) onChanged,
  required TextEditingController controller,
}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: controller,
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 12, color: Colors.white),
    decoration: const InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      hintText: "Your age",
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.white),
    ),
    onChanged: onChanged,
  );
}
