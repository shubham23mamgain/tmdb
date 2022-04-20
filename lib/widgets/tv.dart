import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {
  final List? tv;

  const TvShows({Key? key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Series',
            size: 26,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tv?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: tv![index]['title'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                tv![index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                tv![index]['poster_path'],
                            description: tv![index]['overview'],
                            vote: tv![index]['vote_average'].toString(),
                            releasedOn: tv![index]['release_date'],
                            originalTitle: tv![index]['original_name'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv![index]['backdrop_path'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ModifiedText(
                            text: tv![index]['title'] ??
                                tv![index]['original_name'],
                            size: 12,
                          )
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
