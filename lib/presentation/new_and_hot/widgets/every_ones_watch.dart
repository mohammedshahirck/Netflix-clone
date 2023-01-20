import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/model/model.dart';
import '../../../core/constands.dart';
import '../../home/widget/sliver_button.dart';
import 'videocard.dart';

class EveryOnesWatching extends StatefulWidget {
  final String everyonesimg;
  final int index;
  const EveryOnesWatching({
    Key? key,
    required this.index,
    required this.everyonesimg,
  }) : super(key: key);

  @override
  State<EveryOnesWatching> createState() => _EveryOnesWatchingState();
}

class _EveryOnesWatchingState extends State<EveryOnesWatching> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kKeight,
        Text(
          NetflixApi.southindian[widget.index].title ?? 'coming Soon',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kKeight,
        Text(
          NetflixApi.southindian[widget.index].overview ?? 'coming Soon',
          // "Black Adam is a 2022 American superhero film based on the DC Comics character of the same name. Produced by New Line Cinema, DC Films, Seven Bucks Productions, and FlynnPictureCo., it is a spin-off from Shazam! (2019) and the eleventh film in the DC Extended Universe.",
          style: const TextStyle(color: kgrey),
        ),
        khight50,
        VideoWidget(
          Index: widget.index,
          newhotimg: widget.everyonesimg,
        ),
        kKeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SliverIcon(
              text: 'share',
              ricons: Icons.share_sharp,
              iconSize: 25,
              textSize: 16,
            ),
            KWidth,
            SliverIcon(
              text: 'MyList',
              ricons: Icons.add,
              iconSize: 25,
              textSize: 16,
            ),
            KWidth,
            SliverIcon(
              text: 'Play',
              ricons: Icons.play_arrow,
              iconSize: 25,
              textSize: 16,
            )
          ],
        )
      ],
    );
  }
}
