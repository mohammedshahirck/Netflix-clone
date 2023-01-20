import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/search/widget/search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kKeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(
                    index: index,
                  ),
              separatorBuilder: (ctx, index) => kKeight,
              itemCount: NetflixApi.trendingmovies.length),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final int index;
  const TopSearchItemTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageAppendUrl +
                    NetflixApi.trendingmovies[index]['backdrop_path'],
                //  "https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
              ),
            ),
          ),
        ),
        KWidth,
        Expanded(
          child: Text(
            NetflixApi.trendingmovies[index]['title'] ?? 'coming soon',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
