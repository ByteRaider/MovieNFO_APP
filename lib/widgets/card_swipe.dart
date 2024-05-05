import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwipe extends StatelessWidget {
  final List<Movie> movies;

  const CardSwipe({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.getFullPosterImg())),
              ),
            );
          }),
    );
  }
}
