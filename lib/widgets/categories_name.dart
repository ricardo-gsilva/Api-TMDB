import 'package:flutter/material.dart';

class NameCategory extends StatelessWidget {

  final Function onPressed;
  final String text;

  NameCategory({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              TextButton(
                onPressed: onPressed,
                child: Text(text, 
                style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ],
          );
          
  }
}
