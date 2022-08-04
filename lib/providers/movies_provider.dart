import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/model/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "b9cdeee918703310aaab4595ea754ac8";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  int _popularPage = 0;

  List<Movie> moviesNowPlaying = [];
  List<Movie> moviesPopular = [];

  MoviesProvider() {
    print("movies service");
    getMoviesNowPlaying();
    getMoviesPopular();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  getMoviesNowPlaying() async {
    final nowPlayingResponse =
        NowPlayingResponse.fromJson(await _getJsonData('/3/movie/now_playing'));
    moviesNowPlaying = nowPlayingResponse.results;
    notifyListeners();
  }

  getMoviesPopular() async {
    _popularPage++;
    final popularResponse = NowPlayingResponse.fromJson(
        await _getJsonData('/3/movie/now_playing', _popularPage));
    moviesPopular = [...moviesPopular, ...popularResponse.results];
    notifyListeners();
  }
}
