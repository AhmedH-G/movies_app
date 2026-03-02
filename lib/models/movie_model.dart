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
      id: json['id'],
      title: json['title'],
      image: json['medium_cover_image'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}