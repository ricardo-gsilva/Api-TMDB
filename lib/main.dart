import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_filmes_series/core/theme_app.dart';
import 'package:tmdb_filmes_series/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeApp,
      home: HomePage(),
    );
  }
}

