import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class NumCard extends StatelessWidget {
  final String apiImageUrl;
  final int index;

  const NumCard({super.key, required this.index, required this.apiImageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
                height: 150,
              ),
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(apiImageUrl),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 13,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 5.0,
              strokeColor: kwhite,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    decorationColor: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
