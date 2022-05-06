import 'package:http/http.dart';
import 'package:mvc_practice/network/network_calls.dart';

final client = Client();

final netWorkCalls = NetworkCalls();

abstract class UrlConstants {
  static const String baseUrl =
      'http://www.omdbapi.com/?i=tt3896198&apikey=138ee913';
  static const String raceMovies = '$baseUrl&s=race&type=movie&page=1';
}
