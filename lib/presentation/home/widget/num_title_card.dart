import 'package:flutter/material.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/home/widget/number_card.dart';
import 'package:netflix_app/presentation/widgets/title.dart';

class NumberTitleCard extends StatelessWidget {
  final String image;
  final int trendingindex;
  final List movieIndex;
  const NumberTitleCard({
    Key? key,
    required this.image,
    required this.trendingindex,
    required this.movieIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 Tv Shows India Today',
        ),
        kKeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (
                  index,
                ) =>
                    NumCard(
                      index: index,
                      apiImageUrl: image + movieIndex[index]['poster_path'],
                    )),
          ),
        )
      ],
    );
  }
}
