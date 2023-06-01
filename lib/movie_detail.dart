import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieDetail extends StatelessWidget {
  Map<String, dynamic> movie;
  MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieTitle =
        movie['title'].toString().replaceAll('!HS', '').replaceAll('!HE', '');
    var posters = movie['posters'].split('|')[0];

    return Scaffold(
      appBar: AppBar(
        title: Text('영화 상세 정보($movieTitle)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(movieTitle),
            Row(
              children: [
                Text(movie['keywords']),
                Hero(tag: movie['movieSeq'], child: Image.network(posters))
              ],
            ),
            ReadMoreText(
              movie['plots']['plot'][0]['plotText'],
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: '더보기',
              trimExpandedText: '숨기기',
              moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
              lessStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
