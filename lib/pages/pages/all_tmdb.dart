import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/controller/page_controller.dart';
import 'package:tmdb_filmes_series/pages/details/detail_page.dart';
import 'package:tmdb_filmes_series/widgets/build_appbar.dart';
import 'package:tmdb_filmes_series/widgets/card.dart';
import 'package:tmdb_filmes_series/widgets/messenger.dart';
import 'package:tmdb_filmes_series/widgets/progress.dart';
import 'package:tmdb_filmes_series/widgets/see_all.dart';

class AllTmdb extends StatefulWidget {
  final String typeTmdb;
  final String typeTrend;

  const AllTmdb({Key key, this.typeTmdb, this.typeTrend}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<AllTmdb> {
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

    await _controller.fetchAllTrending(page: lastPage, type: widget.typeTmdb);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: InitAppBar(
          function: init,
        ),
      ),
      body: _buildTrendGrid(),
    );
  }

  _buildTrendGrid() {
    if (_controller.loading) {
      return Progress();
    }

    if (_controller.tmdbError != null) {
      return Messenger(message: _controller.tmdbError.message);
    }

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SeeAll(
            typeTmdb: widget.typeTmdb,
            count: _controller.trendingCount,
            context: _buildCard),
      );
    
  }

  Widget _buildCard(context, index) {
    final trending = _controller.trending[index];
    String type;
    String title;
    if (trending.originalName == null) {
      type = "movie";
      title = trending.originalTitle;
    } else {
      type = "tv";
      title = trending.originalName;
    }
    return CardImage(
      width: 170,
      widthPoster: 150,
      heigthPoster: 220,
      cTmdb: _controller.fetchTrendById,
      poster: trending.posterPath,
      onTap: () => _detailPage(trending.id, type),
      text: title,
    );
  }

  _detailPage(trendingId, String typeId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(trendingId, typeId),
        ));
    print(trendingId);
    print(typeId);
  }
}
