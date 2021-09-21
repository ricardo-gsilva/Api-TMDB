import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/controller/page_controller.dart';
import 'package:tmdb_filmes_series/pages/details/detail_page.dart';
import 'package:tmdb_filmes_series/pages/pages/all_tmdb.dart';
import 'package:tmdb_filmes_series/widgets/card.dart';
import 'package:tmdb_filmes_series/widgets/categories_name.dart';
import 'package:tmdb_filmes_series/widgets/text_custom.dart';

class TvPage extends StatefulWidget { 

  @override
  _TvPageState createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
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
        if (_controller.currentPagesTv == lastPage) {
          lastPage++;
          await _controller.fecthAllTv(page: lastPage);
          setState(() {});
        }
      }
    });
  }

  init() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fecthAllTv(page: lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextCustom(
                text: 'Os Melhores da TV',
              ),
              NameCategory(
                  text: '(Ver Todos)',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AllTmdb(
                              typeTmdb: 'tv'
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
                  itemCount: _controller.tvCount,
                  itemBuilder: _buildCard)),
        ],
      ),
    );
  }

  Widget _buildCard(context, index) {
    final tv = _controller.tv[index];
    return CardImage(
        width: 170,
        widthPoster: 170,
        heigthPoster: 270,
        cTmdb: _controller.fetchTvById,
        poster: tv.posterPath,
        onTap: () => _detailPage(tv.id),
        text: tv.originalName);
  }

  _detailPage(tmdbId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(tmdbId, 'tv'),
        ));
    print(tmdbId);
  }
}
