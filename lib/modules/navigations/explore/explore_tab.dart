import 'package:flutter/material.dart';
import '../../../core/services/movies_service.dart';
import '../../../models/movie_model.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with TickerProviderStateMixin {
  final MoviesService service = MoviesService();

  List<MovieDetails> movies = [];
  List<String> genres = [];
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    movies = await service.getMovies();

    Set<String> genresSet = {};
    for (var movie in movies) {
      genresSet.addAll(movie.genres);
    }
    genres = genresSet.toList();

    tabController = TabController(length: genres.length, vsync: this);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFFFBB3B)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Browse",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Tabs
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TabBar(
            controller: tabController,
            isScrollable: true,

            dividerColor: Colors.transparent,

            indicator: BoxDecoration(
              color: const Color(0xFFFFBB3B),
              borderRadius: BorderRadius.circular(20),
            ),

            indicatorSize: TabBarIndicatorSize.tab,

            labelColor: Colors.black,
            unselectedLabelColor: const Color(0xFFFFBB3B),

            tabAlignment: TabAlignment.start,

            tabs: genres.map((genre) {
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFFBB3B)),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),

                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),

        // Movies Grid
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: genres.map((genre) {
              List<MovieDetails> filteredMovies = movies
                  .where((movie) => movie.genres.contains(genre))
                  .toList();

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          movie.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFffc106), size: 14),
                              const SizedBox(width: 3),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}