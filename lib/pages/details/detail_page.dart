import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/controller/detail_page_controller.dart';
import 'package:tmdb_filmes_series/pages/pages/all_tmdb.dart';
import 'package:tmdb_filmes_series/widgets/build_appbar.dart';
import 'package:tmdb_filmes_series/widgets/card.dart';
import 'package:tmdb_filmes_series/widgets/description.dart';
import 'package:tmdb_filmes_series/widgets/image_poster.dart';
import 'package:tmdb_filmes_series/widgets/info_skills.dart';
import 'package:tmdb_filmes_series/widgets/messenger.dart';
import 'package:tmdb_filmes_series/widgets/progress.dart';

class DetailPage extends StatefulWidget {
  final int tmdbId;
  final String typeTmdb;

  DetailPage(this.tmdbId, this.typeTmdb);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  final _controller = DetailPageController();
  CardImage cardImage;
  AllTmdb alltrend;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });
       
    await _controller.fetchTrendById(widget.tmdbId, widget.typeTmdb);

    setState(() {
      _controller.loading = false;
    });
  }  

  @override
  Widget build(BuildContext context) {
    if (_controller.loading) {
      return Progress();
    } else {
    return Scaffold(
      appBar: PreferredSize(child: _buildAppBar(),preferredSize: Size.fromHeight(50),),      
      body: _buildMovieDetail(),
    );
  }}

  _buildAppBar() {
    String movie = _controller.trendingResult.title;
    String tv = _controller.trendingResult.originalName;
    return InitAppBar(
        name: movie == null ? tv : movie,      
    );
  }

  _buildMovieDetail() {
    if (_controller.tmdbError != null) {
      return Messenger(message: _controller.tmdbError.message);
    }

    return ListView(
      children: [
        _buildCover(),
        _buildStatus(),
        _buildOverview(),
      ],
    );
  }

  _buildOverview() {
    return Description(
      description: _controller.trendingResult.overview
      );
  }

  _buildStatus() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: InfoSkills(
          value: _controller.trendingResult.voteAverage,
          popularity: _controller.trendingResult.popularity,
          date: _controller.trendingResult.releaseDate != null ?
           _controller.trendingResult.releaseDate : _controller.trendingResult.firstAirDate ,
        )
    );
  }

  _buildCover() {
    return Container(
      child: ImagePoster(
        image: _controller.trendingResult.backdropPath,
      ),
    );
  }
}
