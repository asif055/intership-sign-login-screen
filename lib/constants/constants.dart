import 'package:flutter/material.dart';

dynamic showSnack({required text, required context}) {
  var snackDemo = SnackBar(
    content: Text(
      text.toString(),
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.black,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackDemo);
}