import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_filmes_series/core/constants.dart';

class InfoSkills extends StatelessWidget {
  final double popularity;
  final double size;
  final DateTime date;
  final Color color;
  final String dateFormat;
  final double value;

  const InfoSkills(
      {Key key,
      this.popularity,
      this.size = 18,
      this.date,
      this.color = Colors.amber,
      this.dateFormat = dDateFormat,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                value?.toStringAsFixed(1) ?? '0.0',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                popularity.toStringAsFixed(0),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: size),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Chip(
            backgroundColor: color.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            avatar: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.calendar_today,
                size: 20,
                color: Colors.amber,
              ),
            ),
            label: Text(
              DateFormat(dateFormat).format(date),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
      ],
    );
  }
}
