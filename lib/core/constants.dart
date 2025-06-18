import 'package:flutter/material.dart';

const kTextStyleBold = TextStyle(
    fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF212121));

const kTextStyle = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF212121));

InputDecoration kDecorationTextField = const InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 15),
  hintText: 'Enter target strength?',
  hintStyle: TextStyle(
    fontSize: 12,
    color: Colors.black,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
