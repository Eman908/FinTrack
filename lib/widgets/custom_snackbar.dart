import 'package:flutter/material.dart';

SnackBar customSnackBar({required Color color, required String message}) {
  return SnackBar(
    backgroundColor: color,
    content: Text(message, style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 1),
  );
}
