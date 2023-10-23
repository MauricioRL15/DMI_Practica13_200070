import 'dart:async';
import 'package:dmi_practica12_200070/model/Media.dart';
import 'package:dmi_practica12_200070/common/HttpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
}
