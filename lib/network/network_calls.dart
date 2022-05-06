import 'dart:io';
import 'package:http/http.dart';
import '../global.dart';

class NetworkCalls {
  //This is the exact method where communication with outer world occur, that is omdb API. and pass the response to controller class.
  Future<String> get(String url) async {
    Uri uri = Uri.parse(url);
    var response = await client.get(uri);
    checkAndThrowError(response);
    return response.body;
  }

  static void checkAndThrowError(Response response) {
    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
