import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {

  final String text;
  final String ctext;
  final double width;  

  TextCustom({this.text, this.ctext, this.width});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(text == null? ctext : text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white            
          ),
      ),
    );
  }
}