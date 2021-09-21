import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/controller/page_controller.dart';
import 'package:tmdb_filmes_series/pages/details/detail_page.dart';
import 'package:tmdb_filmes_series/pages/pages/all_tmdb.dart';
import 'package:tmdb_filmes_series/widgets/card.dart';
import 'package:tmdb_filmes_series/widgets/categories_name.dart';
import 'package:tmdb_filmes_series/widgets/text_custom.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = PageControl();
  final _scrollController = ScrollController();
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollListener();
    init();
  }

  _scrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_controller.currentPagesMovie == lastPage) {
          lastPage++;
          await _controller.fetchAllMovie(page: lastPage);   
          setState(() {});
          
        }
      }
    });
  }

  init() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovie(page: lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextCustom(
                text: 'Filmes do Momento',
              ),
              NameCategory(
                  text: '(Ver Todos)',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AllTmdb(
                                  typeTmdb: 'movie',
                            )
                        )
                    );
                  }),
            ],
          ),
          Container(
              height: 350,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.movieCount,
                  itemBuilder: _buildCard)),
        ],
      ),
    );
  }

  Widget _buildCard(context, index) {
    final movie = _controller.movie[index];
    return CardImage(
        width: 170,
        widthPoster: 170,
        heigthPoster: 270,
        cTmdb: _controller.fetchMovieById,
        poster: movie.posterPath,
        onTap: () => _detailPage(movie.id),
        text: movie.originalTitle);
  }

  _detailPage(tmdbId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(tmdbId, 'movie'),
        ));
    print(tmdbId);
  }
}
