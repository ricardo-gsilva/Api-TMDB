import 'package:flutter/material.dart';
import 'package:tmdb_filmes_series/widgets/text_custom.dart';

class CardImage extends StatelessWidget {

  final String poster;
  final String text;
  final Function onTap;
  final Function cTmdb;
  final double width;
  final double widthPoster;
  final double heigthPoster;

  const CardImage({
    Key key, 
    this.poster,
    this.widthPoster,
    this.heigthPoster,
    this.width,
    this.cTmdb, 
    this.text, 
    this.onTap,
  }) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InkWell(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: heigthPoster,
                    width: widthPoster,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500$poster'),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
            ),
            TextCustom(
              text: text,
              width: width <= 200 ? 150 : 250
            )
          ],
        ),      
      ),
    );
  }

  
}

