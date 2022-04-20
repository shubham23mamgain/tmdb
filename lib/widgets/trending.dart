import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';
import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List? trending;

  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            size: 26,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: trending![index]['title'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                trending![index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                trending![index]['poster_path'],
                            description: trending![index]['overview'],
                            vote: trending![index]['vote_average'].toString(),
                            releasedOn: trending![index]['release_date'],
                            originalTitle: trending![index]['original_name'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending![index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          ModifiedText(
                            text: trending![index]['title'] ??
                                trending![index]['original_name'],
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
