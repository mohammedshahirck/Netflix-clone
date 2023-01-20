import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/widget/sliver_button.dart';

class BackgroundCard extends StatelessWidget {
  final List backgroundimage;
  const BackgroundCard({
    Key? key,
    required this.backgroundimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List mainImag = [
      imageAppendUrl + NetflixApi.comingsoon[0].posterPath!
    ];

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(mainImag[0]
                  // 'https://www.themoviedb.org/t/p/w220_and_h330_face/1qa8bdz9fem4n1MC8OoQJhgCwUi.jpg',
                  //  imageAppendUrl + backgroundimage[0]['poster_path'] ??
                  ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SliverIcon(
                ricons: Icons.add,
                text: 'My List',
              ),
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kwhite)),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  size: 25,
                  color: Colors.black,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Play',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              const SliverIcon(text: 'Info', ricons: Icons.info),
            ],
          ),
        ),
      ],
    );
  }
}
