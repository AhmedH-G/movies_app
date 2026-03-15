class Movie {
  final int id;
  final String title;
  final String image;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? "No Title",
      image: json['medium_cover_image'] ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class Cast {
  final String name;
  final String character;
  final String image;

  Cast({
    required this.name,
    required this.character,
    required this.image,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? "Unknown",
      character: json['character_name'] ?? "Unknown",
      image: json['url_small_image'] ?? "",
    );
  }
}

class MovieDetails {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String description;
  final List<String> genres;
  final int year;
  final int likeCount;
  final int runtime;
  final String movieTrailer;
  final String movieUrl;
  final List<String> screenshots;
  final List<Cast> cast;

  MovieDetails({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
    required this.genres,
    required this.year,
    required this.likeCount,
    required this.runtime,
    required this.movieTrailer,
    required this.movieUrl,
    required this.screenshots,
    required this.cast,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'] ?? 0,
      title: json['title'] ?? "No Title",
      image: json['large_cover_image'] ?? json['medium_cover_image'] ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description_full'] ?? "No Description",
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
      year: json['year'] ?? 0,
      likeCount: json['like_count'] ?? 0,
      runtime: json['runtime'] ?? 0,
      movieTrailer: json['yt_trailer_code'] ?? "",
      movieUrl: json['url'] ?? "",
      screenshots: [
        if (json['medium_screenshot_image1'] !=
            null) json['medium_screenshot_image1'],
        if (json['medium_screenshot_image2'] !=
            null) json['medium_screenshot_image2'],
        if (json['medium_screenshot_image3'] !=
            null) json['medium_screenshot_image3'],
      ],
      cast: (json['cast'] != null && json['cast'] is List)
          ? (json['cast'] as List).map((c) => Cast.fromJson(c)).toList()
          : [],
    );
  }
}