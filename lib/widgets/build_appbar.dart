import 'package:flutter/material.dart';

class InitAppBar extends StatelessWidget {

  final Function function;
  final String name;
  final Image image = Image.asset('images/tmdb_logo.png', height: 40,);

  InitAppBar({this.function, this.name});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: name != null ? Text(name) : image,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: function,
          ),
        ],
      );
  }  
}

