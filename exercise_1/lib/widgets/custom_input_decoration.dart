import 'package:flutter/material.dart';

InputDecoration customInputDecoration({required String label, required IconData prefixIcon}) {
  return InputDecoration(
    fillColor: Colors.white,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ), // Viền đen khi không focus
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ), // Viền đen khi focus
    filled: true,
    labelStyle: const TextStyle(color: Color(0xFF949494)), // Màu chữ nhãn
    labelText: label,
    prefixIcon: Icon(
      prefixIcon,
      color: const Color(0xFF949494),
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}