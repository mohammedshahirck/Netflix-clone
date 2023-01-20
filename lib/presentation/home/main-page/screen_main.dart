import 'package:flutter/material.dart';
import 'package:netflix_app/Api%20Function/Api_function.dart';
import 'package:netflix_app/presentation/downloads/widget/screen_downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_app/presentation/home/main-page/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/search/search.dart';

class ScreenHomepage extends StatefulWidget {
  const ScreenHomepage({super.key});

  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  @override
  void initState() {
    NetflixApi();
    super.initState();
    setState(() {});
  }

  calling() async {
    await NetflixApi.loadMovies();
    await NetflixApi.fetchMovie();
    await NetflixApi.everyOne();
    setState(() {});
  }

  final _pages = [
    const HomeScreen(),
    const NewAndHot(),
    const FastLaugh(),
    const ScreenSearch(),
    const Downloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexedchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
