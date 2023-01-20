import 'package:flutter/material.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/search/widget/search_result.dart';

class Video_ListItem extends StatelessWidget {
  final int index;
  const Video_ListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Positioned(
          bottom: 6,
          left: 5,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.4),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  kKeight,
                  VideoActionsWidget(
                    icon: Icons.emoji_emotions_rounded,
                    title: 'LOL',
                  ),
                  VideoActionsWidget(
                    icon: Icons.add,
                    title: 'My List',
                  ),
                  VideoActionsWidget(
                    icon: Icons.share,
                    title: 'Share',
                  ),
                  VideoActionsWidget(
                    icon: Icons.play_arrow,
                    title: 'Play',
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.black.withOpacity(.6),
        ),
        Text(title),
      ],
    );
  }
}
