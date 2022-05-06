import 'dart:convert';
import 'package:mvc_practice/global.dart';
import 'package:mvc_practice/models/movie.dart';
import 'package:mvc_practice/models/movies_collection.dart';

class MovieApi {
  // get  movie details through movie name pass into parameter, from omdb api by baseUrl call through network class client method
  Future<Movie> getMovieInfo(String movieName) async {
    String response =
        await netWorkCalls.get('${UrlConstants.baseUrl}&t=$movieName');
    return Movie.fromJson(jsonDecode(response));
  }

  // get list of movies from omdb api by baseUrl call through network class client method
  Future<MoviesCollection> getAllMovies() async {
    var response = await netWorkCalls.get(UrlConstants.raceMovies);
    return MoviesCollection.fromJson(jsonDecode(response));
  }
}
