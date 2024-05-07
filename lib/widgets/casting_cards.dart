import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 150),
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 180,
              child: const CircularProgressIndicator(),
            );
          }
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(),
            ),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: const Column(children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage('https://picsum.photos/300/400'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            )),
        SizedBox(height: 5),
        Text(
          'actor.name',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
