import 'package:flutter/material.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final String image;
  final int trendingindex;
  final List movieIndex;

  const MainTitleCard({
    Key? key,
    required this.title,
    required this.image,
    required this.trendingindex,
    required this.movieIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kKeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                movieIndex.length,
                // trendingindex,
                (
                  index,
                ) =>
                    MainCard(
                      apiImageUrl: image + movieIndex[index]['poster_path'],
                    )),
          ),
        )
      ],
    );
  }
}
