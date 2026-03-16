import 'package:flutter/material.dart';
import '../../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieDetails movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              movie.image,
              width: double.infinity,
              fit: BoxFit.cover,

              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        /// Rating
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(width: 3),
            Text(
              movie.rating.toString(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}