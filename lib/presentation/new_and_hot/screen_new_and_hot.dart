import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/core/String.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/every_ones_watch.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  @override
  void initState() {
    NetflixApi();
    NetflixApi.fetchMovie();
    NetflixApi.getdata();
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                KWidth,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 2),
                  child: Container(
                    color: const Color.fromARGB(255, 4, 83, 103),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          width: 12,
                          height: 3,
                        )
                      ],
                    ),
                    // decoration: const BoxDecoration(
                    //     image: DecorationImage(image: AssetImage('assets/download.png'))),
                    width: 30,
                    height: 30,
                  ),
                ),
                KWidth,
              ],
              bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator:
                      BoxDecoration(color: kwhite, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿Coming Soon',
                    ),
                    Tab(
                      text: '👀 Everyone\'s Watching',
                    ),
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buidComingSoon(),
            _buidEveryWatching(),
          ])),
    );
  }

  Widget _buidComingSoon() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: NetflixApi.comingsoon.length,
      itemBuilder: (BuildContext context, int index) {
        return ComingSoon(
          index: index,
          comingsoonimg:
              imageAppendUrl + NetflixApi.comingsoon[index].backdropPath!,
        );
      },
    );
  }

  Widget _buidEveryWatching() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 10),
      itemCount: NetflixApi.southindian.length,
      itemBuilder: (context, index) => EveryOnesWatching(
        index: index,
        everyonesimg:
            imageAppendUrl + NetflixApi.southindian[index].backdropPath!,
      ),
    );
  }
}
