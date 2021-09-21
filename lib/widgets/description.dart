import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String description;
  final double size = 18;
  final Function function;

  Description({this.description, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Text(description,      
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: size),   
          ),
    );
  }
}