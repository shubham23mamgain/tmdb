import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';

import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List? topRated;

  const TopRatedMovies({Key? key, this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: topRated?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: topRated![index]['title'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                topRated![index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                topRated![index]['poster_path'],
                            description: topRated![index]['overview'],
                            vote: topRated![index]['vote_average'].toString(),
                            releasedOn: topRated![index]['release_date'],
                            originalTitle: topRated![index]['original_name'],
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
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRated![index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          ModifiedText(
                            text: topRated![index]['title'] ??
                                topRated![index]['original_name'],
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
