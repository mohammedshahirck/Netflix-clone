import 'dart:convert';
import 'package:netflix_app/model/model.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class NetflixApi {
  static const String apiKey = 'd3b2966b5d1a154a514d8c1b57bc763d';
  static const readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkM2IyOTY2YjVkMWExNTRhNTE0ZDhjMWI1N2JjNzYzZCIsInN1YiI6IjYzNTJhYzllYTBmMWEyMDA3Y2RkZDdmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YiRPFJbmirRK-rD8sns5brTP7RiRpSYg3eDV1KJG-UY';

  static List trendingmovies = [];
  static List tv = [];
  static List top10tv = [];
  static List releasepastyear = [];
  static List<NetFlix> southindian = [];
  static List tenseDream = [];
  static List<NetFlix> comingsoon = [];

  static loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map tensedream = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    // Map southIndia = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    // print(trendingresult);

    trendingmovies = trendingresult['results'];
    tv = tvresults['results'];
    top10tv = topratedresults['results'];
    tenseDream = tensedream['results'];
    //southindian = southIndia['results'];
  }

  static Future<List<NetFlix>> fetchMovie() async {
    final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=d3b2966b5d1a154a514d8c1b57bc763d',
    ));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => NetFlix.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to the load movie');
    }
  }

  static Future<List<NetFlix>> everyOne() async {
    final response1 = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=d3b2966b5d1a154a514d8c1b57bc763d&language=en-US&page=1',
    ));
    if (response1.statusCode == 200) {
      final result = jsonDecode(response1.body);
      Iterable list = result['results'];
      return list.map((movie) => NetFlix.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to the load movie');
    }
  }

  static getdata() async {
    comingsoon = await fetchMovie();
    southindian = await everyOne();
  }
}
