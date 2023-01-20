import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/home/widget/sliver_button.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/videocard.dart';

class ComingSoon extends StatefulWidget {
  final String comingsoonimg;
  final int index;
  const ComingSoon({
    Key? key,
    required this.index,
    required this.comingsoonimg,
  }) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: MediaQuery.of(context).size.height * .69,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                NetflixApi.comingsoon[widget.index].releaseDate ??
                    "coming Soon",
                style: TextStyle(
                  fontSize: 18,
                  color: kgrey,
                ),
              ),
              // Text(
              //   '11',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: MediaQuery.of(context).size.height * .69,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                Index: widget.index,
                newhotimg: widget.comingsoonimg,
              ),
              Row(
                children: [
                  Text(
                    NetflixApi.comingsoon[widget.index].title ?? "coming Soon",
                    maxLines: 1,
                    style: const TextStyle(
                        letterSpacing: -2,
                        fontSize: 25,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const SliverIcon(
                    text: 'Remind Me',
                    ricons: Icons.notifications_outlined,
                    iconSize: 20,
                    textSize: 10,
                  ),
                  KWidth,
                  const SliverIcon(
                    text: 'Info',
                    ricons: Icons.info,
                    iconSize: 20,
                    textSize: 10,
                  ),
                  KWidth,
                ],
              ),
              // kKeight,
              // const Text('Coming on Friday'),
              // kKeight,
              Text(
                NetflixApi.comingsoon[widget.index].title ?? "coming Soon",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                NetflixApi.comingsoon[widget.index].overview ?? "coming Soon",
                // "Black Adam is a 2022 American superhero film based on the DC Comics character of the same name. Produced by New Line Cinema, DC Films, Seven Bucks Productions, and FlynnPictureCo., it is a spin-off from Shazam! (2019) and the eleventh film in the DC Extended Universe.",
                style: TextStyle(color: kgrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
