import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/controller/page_controller.dart';
import 'package:tmdb_filmes_series/pages/details/detail_page.dart';
import 'package:tmdb_filmes_series/pages/pages/all_tmdb.dart';
import 'package:tmdb_filmes_series/widgets/card.dart';
import 'package:tmdb_filmes_series/widgets/categories_name.dart';
import 'package:tmdb_filmes_series/widgets/text_custom.dart';

class TrendingPage extends StatefulWidget {
  final bool tv;
  final bool movie;

  const TrendingPage({
    Key key,
    this.tv = false,
    this.movie = false,
  }) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
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
        if (_controller.currentPagesTrend == lastPage) {
          lastPage++;
          await _controller.fetchAllTrending(page: lastPage);
          setState(() {});
        }
      }
    });
  }

  init() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllTrending(page: lastPage);

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
              TextCustom(text: 'Mais Procurados'),
              NameCategory(
                text: '(Dia)',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => AllTmdb(
                                typeTmdb: 'day',
                              )));
                },
              ),
              NameCategory(
                text: '(Semana)',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => AllTmdb(
                                typeTmdb: 'week',
                              )
                      )
                  );
                },
              ),
            ],
          ),
          Container(
              height: 280,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.trendingCount,
                  itemBuilder: _buildCard)),
        ],
      ),
    );
  }

  Widget _buildCard(context, index) {
    final trending = _controller.trending[index];
    String type;
    String tv = trending.name;
    String movie = trending.title;
    if (tv == null) {
      type = "movie";
    }
    if (movie == null) {
      type = "tv";
    }
    return CardImage(
      width: 280,
      widthPoster: 280,
      heigthPoster: 220,
      cTmdb: _controller.fetchTrendById,
      poster: trending.posterPath,
      onTap: () => _detailPage(trending.id, type),
      text: trending.originalName == null
          ? trending.originalTitle
          : trending.originalName,
    );
  }

  _detailPage(trendingId, String typeId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(trendingId, typeId),
        ));
    print(trendingId);
  }
}
