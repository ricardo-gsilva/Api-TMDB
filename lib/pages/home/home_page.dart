import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/pages/pages/movie_page.dart';
import 'package:tmdb_filmes_series/pages/pages/trending_page.dart';
import 'package:tmdb_filmes_series/pages/pages/tv_page.dart';
import 'package:tmdb_filmes_series/widgets/build_appbar.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: InitAppBar(
        ),
      ),
      body: ListView(
        children: [
          TrendingPage(),
          MoviePage(),
          TvPage()
        ],
      ),
    );
  }
}