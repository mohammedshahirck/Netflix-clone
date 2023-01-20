import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';

class VideoWidget extends StatelessWidget {
  final int Index;
  final String newhotimg;
  const VideoWidget({
    Key? key,
    required this.Index,
    required this.newhotimg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            // NewAndHotTempImg,

            newhotimg,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.withOpacity(.4),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
