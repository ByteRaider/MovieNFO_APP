import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(),
      SliverList(
        delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          const CastingCards(),
        ]),
      )
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
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
          child: const Text(
            'movie.title',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage('https://picsum.photos/500/300'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 500),
          fadeInCurve: Curves.easeIn,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage('https://picsum.photos/300/400'),
              height: 150,
            )),
        const SizedBox(width: 20),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'movie.title',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            'movie.OriginalTitle',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(children: [
            Icon(Icons.star_outline, size: 20, color: Colors.yellow),
            SizedBox(width: 5),
            Text('movie.releaseDate', style: TextStyle(color: Colors.white)),
          ])
        ])
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: const Text(
        'movie.overview',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
