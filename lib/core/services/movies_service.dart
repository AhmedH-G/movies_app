import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/movie_model.dart';

class MoviesService {

  Future<List<MovieDetails>> getMovies() async {
    const String url = "https://yts.lt/api/v2/list_movies.json";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List moviesJson = data['data']['movies'] ?? [];

      return moviesJson.map((movie) => MovieDetails.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    final String url =
        "https://movies-api.accel.li/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == "ok" && data['data'] != null) {
        return MovieDetails.fromJson(data['data']['movie']);
      } else {
        throw Exception("Movie not found");
      }
    } else {
      throw Exception("Failed to load movie details");
    }
  }

  Future<List<MovieDetails>> getMovieSuggestions(int movieId) async {
    final String url = "https://movies-api.accel.li/api/v2/movie_suggestions.json?movie_id=$movieId";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['data'] != null && data['data']['movies'] != null) {
          final List moviesJson = data['data']['movies'];
          return moviesJson
              .map((movie) => MovieDetails.fromJson(movie))
              .toList();
        }
        return [];
      } else {
        return [];
      }
    } catch (e) {
      print("Error in Suggestions: $e");
      return [];
    }
  }

  Future<List<MovieDetails>> searchMovies(String query) async {
    final String url =
        "https://yts.lt/api/v2/list_movies.json?query_term=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List moviesJson = data['data']['movies'] ?? [];

      return moviesJson
          .map((movie) => MovieDetails.fromJson(movie))
          .toList();
    } else {
      throw Exception("Failed to search movies");
    }
  }
}