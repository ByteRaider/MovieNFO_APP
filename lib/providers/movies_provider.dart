import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '7b433b7afe7c810996ff37e1804bb68d';
  final String _baseUrl = 'api.themoviedb.org';
  //String _imageUrl = 'https://image.tmdb.org/t/p/w500';
  final String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider');
    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    if (response.statusCode > 300) return (response.statusCode);
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    print(decodedData);
  }
}