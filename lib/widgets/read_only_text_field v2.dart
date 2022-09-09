import 'package:flutter/material.dart';

final TextEditingController text = TextEditingController();

Widget readOnlyTextField(String hintText, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      controller: text,
      readOnly: true,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: color,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: color,
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          )),
    ),
  );
}
