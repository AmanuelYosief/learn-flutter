import 'dart:convert';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

class Webservice {
  // A service which uses a HTTP package to make a network request via API, 
  //  this is then converted into a json response. 
  // This service is sent to the model called (movie) to transform the data
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=2edfcd25";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
