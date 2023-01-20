import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class SliverIcon extends StatelessWidget {
  final String text;
  final IconData ricons;
  final double iconSize;
  final double textSize;

  const SliverIcon({
    Key? key,
    required this.text,
    required this.ricons,
    this.iconSize = 30,
    this.textSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          ricons,
          size: iconSize,
          color: kwhite,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
