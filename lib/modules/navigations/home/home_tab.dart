import 'package:flutter/material.dart';
import '../../../core/services/movies_service.dart';
import '../../../models/movie_model.dart';
import 'package:movies/modules/movie_details/movie_details_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final MoviesService service = MoviesService();
  late Future<List<MovieDetails>> movies;
  late PageController pageController;
  double pageOffset = 0.0;

  @override
  void initState() {
    super.initState();
    movies = service.getMovies();

    pageController = PageController(viewportFraction: 0.7);

    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<MovieDetails>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Failed to load movies",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final moviesList = snapshot.data!;

          return Stack(
            children: [
              Positioned.fill(
                child: moviesList.isNotEmpty
                    ? Image.network(
                        moviesList[pageOffset.round() % moviesList.length]
                            .image,
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.4),
                        colorBlendMode: BlendMode.darken,
                      )
                    : Container(color: Colors.black),
              ),

              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 30),

                  Center(
                    child: Image.asset(
                      "assets/images/Available Now.png",
                      width: 220,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 320,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: moviesList.length,
                      itemBuilder: (context, index) {
                        double scale = index == pageOffset.round() ? 1.0 : 0.8;

                        final movie = moviesList[index];

                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: scale, end: scale),
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.ease,
                          builder: (context, value, child) {
                            return Transform.scale(scale: value, child: child);
                          },

                          child: GestureDetector(
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
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(movie.image),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            movie.rating.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Image.asset(
                      "assets/images/Watch Now.png",
                      width: 220,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Action",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                      Row(
                        children: const [
                          Text(
                            "See More",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.yellow,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moviesList.length,
                      itemBuilder: (context, index) {
                        final movie = moviesList[index];

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
                            width: 120,
                            margin: const EdgeInsets.only(right: 12),

                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          movie.image,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),

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
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
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

                                const SizedBox(height: 6),

                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.white,
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
            ],
          );
        },
      ),
    );
  }
}
