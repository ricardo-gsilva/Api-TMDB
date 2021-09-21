import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  final String message;
  final Color color;
  final double iconSize;
  final IconData icon;
  final double space;
  final EdgeInsets padding;

  const Messenger({
    Key key,
    @required this.message,
    this.color = Colors.white24,
    this.iconSize = 64,
    this.icon = Icons.warning,
    this.space = 10,
    this.padding = const EdgeInsets.all(20)
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIcon(),
          SizedBox(height: space,),
          _buildText(),
        ],
      ),
    );
  }

  _buildIcon(){
    return Icon(
      icon,
      color: color,
      size: iconSize,
    );
  }

  _buildText(){
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: color),
    );
  }
}