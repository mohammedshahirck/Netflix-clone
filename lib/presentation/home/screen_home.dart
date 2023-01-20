import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/home/widget/background_card.dart';
import 'package:netflix_app/presentation/home/widget/num_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NetflixApi.loadMovies();
    calling();
    super.initState();
  }

  calling() {
    setState(() {
      NetflixApi.loadMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(
                      backgroundimage: NetflixApi.comingsoon,
                    ),
                    MainTitleCard(
                      title: 'Release in the past year',
                      image: imageAppendUrl,
                      movieIndex: NetflixApi.tv,
                      trendingindex: NetflixApi.tv.length,
                    ),
                    MainTitleCard(
                      title: 'Trending Now',
                      image: imageAppendUrl,
                      trendingindex: NetflixApi.trendingmovies.length,
                      movieIndex: NetflixApi.trendingmovies,
                    ),
                    NumberTitleCard(
                      image: imageAppendUrl,
                      movieIndex: NetflixApi.top10tv,
                      trendingindex: NetflixApi.top10tv.length,
                    ),
                    MainTitleCard(
                      title: 'Tense Dreams ',
                      image: imageAppendUrl,
                      movieIndex: NetflixApi.tenseDream,
                      trendingindex: NetflixApi.tenseDream.length,
                    ),
                    // MainTitleCard(
                    //   title: 'South Indian Cinema',
                    //   image: imageAppendUrl,
                    //   movieIndex: NetflixApi.southindian,
                    //   trendingindex: NetflixApi.southindian.length,
                    // )
                  ],
                ),
                scrollnotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 80,
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/124px-Netflix_2015_N_logo.svg.png",
                                    width: 30,
                                    height: 40,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                  ),
                                  KWidth,
                                  Container(
                                    color:
                                        const Color.fromARGB(255, 4, 83, 103),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            CircleAvatar(
                                              backgroundColor: kwhite,
                                              radius: 2,
                                            ),
                                            CircleAvatar(
                                              backgroundColor: kwhite,
                                              radius: 2,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          color: kwhite,
                                          width: 11,
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
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: kHomeTitleText),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kKeight,
              ],
            ),
          );
        },
      )),
    );
  }
}
