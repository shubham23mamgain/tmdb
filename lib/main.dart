import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';
import 'package:tmdb/widgets/topRated.dart';
import 'package:tmdb/widgets/trending.dart';
import 'package:tmdb/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Auth
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvSeries = [];

  final String apiKey = 'a480edae67df02ba8cd95b2c3171eabd';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDgwZWRhZTY3ZGYwMmJhOGNkOTViMmMzMTcxZWFiZCIsInN1YiI6IjVkZjdkNGJjNWMzMjQ3MDAxODdiNTNiOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6DAOoRjUguotU1-aPV4qtBn86CSCLQe90sj3TyKuMtk';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvSeries = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const ModifiedText(text: 'TMDB App'),
      ),
      body: ListView(
        children: [
          TvShows(tv: tvSeries),
          TopRatedMovies(
            topRated: topRatedMovies,
          ),
          TrendingMovies(
            trending: trendingMovies,
          ),
        ],
      ),
    );
  }
}
