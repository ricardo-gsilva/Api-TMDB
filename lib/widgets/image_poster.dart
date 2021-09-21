import 'package:flutter/material.dart';

class ImagePoster extends StatelessWidget {
  // final _controller = DetailPageController();

  final String image;

  ImagePoster({this.image});

  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage('https://image.tmdb.org/t/p/w500$image'));
  }
}
