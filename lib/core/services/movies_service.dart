import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/movie_model.dart';

class MoviesService {

  Future<List<Movie>> getMovies() async {
    const String url = "https://yts.lt/api/v2/list_movies.json";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List moviesJson = data['data']['movies'];

      return moviesJson
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}