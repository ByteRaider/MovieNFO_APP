import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '7b433b7afe7c810996ff37e1804bb68d';
  final String _baseUrl = 'api.themoviedb.org';
  //String _imageUrl = 'https://image.tmdb.org/t/p/w500';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    getNowPlayingMovies();
    getPopularMovies();
  }
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse =
        NowPlayingResponse.fromJson(jsonDecode(jsonData));
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    //await jsonData
    final jsonData = await _getJsonData(
      '/3/movie/popular',
      _popularPage,
    );
    //parse jsonData
    final popularResponse = PopularResponse.fromJson(jsonDecode(jsonData));
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //check cache
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    //await jsonData
    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    //parse jsonData
    final creditsResponse = CreditsResponse.fromJson(jsonDecode(jsonData));
    //add to cache
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final response = await http.get(url);
    final searchMoviesResponse =
        SearchMovieResponse.fromJson(jsonDecode(response.body)).results;
    return searchMoviesResponse;
  }
}
