import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/services/movies_service.dart';
import '../../../models/movie_model.dart';
import '../../movie_details/movie_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final MoviesService service = MoviesService();
  final TextEditingController searchController = TextEditingController();

  List<MovieDetails> movies = [];
  bool isLoading = false;

  Timer? debounce;

  void searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        movies = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final results = await service.searchMovies(query);

    setState(() {
      movies = results;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white),

                  prefixIcon: const Icon(Icons.search, color: Colors.grey),

                  filled: true,
                  fillColor: const Color(0xff282A28),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),

                onChanged: (value) {
                  if (debounce?.isActive ?? false) {
                    debounce!.cancel();
                  }

                  debounce = Timer(const Duration(milliseconds: 400), () {
                    searchMovies(value);
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            /// Movies
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    )
                  : movies.isEmpty
                  ? Center(

                      child: Assets.images.popcorn.image(width: 200)
                      // Image.asset(
                      //   "assets/images/Empty.png",
                      //   width: 200,
                      // ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),

                      itemCount: movies.length,

                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    MovieDetailsScreen(movieId: movie.id),
                              ),
                            );
                          },

                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),

                              image: DecorationImage(
                                image: NetworkImage(movie.image),
                                fit: BoxFit.cover,
                              ),
                            ),

                            child: Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  left: 8,

                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 14,
                                        ),

                                        const SizedBox(width: 4),

                                        Text(
                                          movie.rating.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
