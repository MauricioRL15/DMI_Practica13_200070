import 'dart:async';
import 'package:dmi_practica13_200070/model/Cast.dart';
import 'package:dmi_practica13_200070/model/Media.dart';
import 'package:dmi_practica13_200070/common/HttpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
  Future<List<Cast>> fetchCast(int mediaId);
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
  
  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
  
  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShows(mediaId);
  }
}
