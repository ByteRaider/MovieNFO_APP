import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider');
    this.getNowPlayingMovies();
  }

  getNowPlayingMovies() {
    print('getNowPlayingMovies');
  }
}
