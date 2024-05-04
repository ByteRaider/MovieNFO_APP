import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (_, int index) => const _MoviePoster(),
            )),
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: 130,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/noImage.jpg'),
                image: NetworkImage('https://picsum.photos/300/400'),
                height: 140,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Movie Title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
