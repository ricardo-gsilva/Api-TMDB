import 'package:flutter/material.dart';

final themeApp = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.amber,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary
  )
);