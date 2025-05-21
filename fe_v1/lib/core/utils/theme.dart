import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/color_base.dart';

final ThemeData myTheme = ThemeData(
  brightness: Brightness.light, // hoặc Brightness.dark
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'LeagueSpartan',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
  ),

  iconTheme: const IconThemeData(color: Colors.deepPurple),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: ColorBase.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
