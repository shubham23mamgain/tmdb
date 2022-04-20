import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';

class Description extends StatelessWidget {
  final String? name,
      description,
      bannerUrl,
      posterUrl,
      vote,
      releasedOn,
      originalTitle;

  const Description(
      {Key? key,
      this.name,
      this.description,
      this.originalTitle,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.releasedOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: '  🌟 Average Rating - ' + vote.toString(),
                      size: 18,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 5,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                text: name ?? originalTitle,
                size: 24,
              ),
            ),
            name != null
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: ModifiedText(
                      text: ' Release Date -' + releasedOn!,
                      size: 14,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl!),
                ),
                Flexible(
                  child: ModifiedText(
                    text: description,
                    size: 18,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
