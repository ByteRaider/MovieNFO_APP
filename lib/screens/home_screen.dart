import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('in Theaters Now'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          CardSwipe(),
          MovieSlider(),
          MovieSlider(),
          MovieSlider(),
          MovieSlider(),
        ]),
      ),
    );
  }
}
