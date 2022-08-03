import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/model/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "b9cdeee918703310aaab4595ea754ac8";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  List<Movie> moviesNowPlaying = [];
  List<Movie> moviesPopular = [];

  MoviesProvider() {
    print("movies service");
    getMoviesNowPlaying();
    getMoviesPopular();
  }

  getMoviesNowPlaying() async {
    print('getting movies');

    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '{1}'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    moviesNowPlaying = nowPlayingResponse.results;
    notifyListeners();
  }

  getMoviesPopular() async {
    print('getting popular movies');

    var url = Uri.https(_baseUrl, '/3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '{1}'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    moviesPopular = [...moviesPopular, ...popularResponse.results];
    notifyListeners();
  }
}
