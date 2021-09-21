import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  final _scrollController = ScrollController();
  final int lastPage = 1;

  final int count;
  final dynamic context;
  final String typeTmdb;

  SeeAll({this.count, this.typeTmdb, this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildTrendGrid(),
    );
  }

  _buildTrendGrid() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                padding: const EdgeInsets.all(2),
                itemCount: count,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.44),
                itemBuilder: context),
          ),
        ],
      ),
    );
  }
}
