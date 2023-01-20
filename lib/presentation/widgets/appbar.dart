import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/main.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KWidth,
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        KWidth,
        Container(
          color: const Color.fromARGB(255, 4, 83, 103),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvatar(
                    backgroundColor: kwhite,
                    radius: 3,
                  ),
                  CircleAvatar(
                    backgroundColor: kwhite,
                    radius: 3,
                  ),
                ],
              ),
              Container(
                color: kwhite,
                width: 13,
                height: 3,
              )
            ],
          ),
          // decoration: const BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/download.png'))),
          width: 30,
          height: 30,
        ),
        KWidth,
      ],
    );
  }
}
