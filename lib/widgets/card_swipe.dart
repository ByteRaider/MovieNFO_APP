import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://picsum.photos/id/$index/300/400')),
              ),
            );
          }),
    );
  }
}
