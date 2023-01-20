import 'package:flutter/cupertino.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/search/widget/search_title.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';

const imageUrl =
    'https://cdn.cinematerial.com/p/297x/vbfr26yz/aladdin-movie-poster-md.jpg?v=1552401018';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kKeight,
        Expanded(
          child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 0,
              mainAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(20, (index) {
                return MainCard(
                  apiImageUrl: imageAppendUrl +
                      NetflixApi.trendingmovies[index]['backdrop_path'],
                );
              })),
        ),
      ],
    );
  }
}

// class MainCard extends StatelessWidget {
//   const MainCard({super.key, required String imagerl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           image: const DecorationImage(
//               image: NetworkImage(
//                 imageUrl,
//               ),
//               fit: BoxFit.cover)),
//     );
//   }
// }
