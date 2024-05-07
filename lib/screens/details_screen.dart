import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(movie: movie),
      SliverList(
        delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _Overview(
            movie: movie,
          ),
          _Overview(
            movie: movie,
          ),
          const CastingCards(),
        ]),
      )
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/img/loading.gif'),
          image: NetworkImage(movie.getFullBackdropPath()),
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeInCurve: Curves.easeIn,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({required this.movie});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/loading.gif'),
              image: NetworkImage(movie.getFullPosterImg()),
              height: 150,
            )),
        const SizedBox(width: 20),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              movie.originalTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              movie.originalTitle,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const Row(children: [
              Icon(Icons.star_outline, size: 20, color: Colors.yellow),
              SizedBox(width: 5),
              Text('movie.releaseDate', style: TextStyle(color: Colors.white)),
            ])
          ]),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
