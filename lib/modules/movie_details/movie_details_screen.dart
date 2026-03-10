import 'package:flutter/material.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/widgets/custom_movie_detalis.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/movie_info_card_widget.dart';
import '../../core/services/movies_service.dart';
import '../../models/movie_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MoviesService service = MoviesService();

  late Future<MovieDetails> movieDetails;
  late Future<List<MovieDetails>> similarMovies;

  bool isSelected = true;

  @override
  void initState() {
    super.initState();
    movieDetails = service.getMovieDetails(widget.movieId);
    similarMovies = service.getMovieSuggestions(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: FutureBuilder<MovieDetails>(
        future: movieDetails,
        builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      final movie = snapshot.data!;

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        // ---------- Cover Image + Back/Bookmark ----------
        Stack(
        children: [
        Image.network(
          movie.image,
          width: double.infinity,
          height: height * 0.6,
          fit: BoxFit.cover,
        ),
        Container(
          height: height * 0.6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorPallete.colorBlack.withOpacity(0.2),
                ColorPallete.colorBlack,
              ],
              stops: const [0.0, 0.9],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 35,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          IconButton(
          icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
        icon: Icon(
        isSelected
        ? Icons.bookmark_border_rounded
            : Icons.bookmark_rounded,
        color: Colors.white,
        size: 30,
      ),
    onPressed: () {
    setState(() {
    isSelected = !isSelected;});
    },
        ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Assets.images.videoPlay.image(),
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontFamily: "Roboto",
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                movie.year.toString(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: ColorPallete.colorGrey,
                ),
              ),
            ],
          ),
        ),
        ],
      ),

    const SizedBox(height: 15),

    // ---------- Watch Button ----------
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
    width: double.infinity,
    height: 58,
    child: CustomElevatedButton(
    bottonText: "Watch",
    backgroundColor: ColorPallete.buttonRedColor,
    bordarColor: ColorPallete.buttonRedColor,
    textColor: ColorPallete.generalTextColor,
    fontType: "Roboto",
    onPressed: () {},
    ),
    ),
    ),

    const SizedBox(height: 15),

    // ---------- Movie Info ----------
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    MovieInfoCardWidget(
    label: movie.likeCount.toString(),
    iconAsset: Assets.icons.likes,
    ),
    const SizedBox(width: 16),
    MovieInfoCardWidget(
    label: movie.runtime.toString(),
    iconAsset: Assets.icons.time,
    ),
    const SizedBox(width: 16),
    MovieInfoCardWidget(
    label: movie.rating.toString(),
    iconAsset: Assets.icons.rate,
    ),
    ],
    ),
    ),

    const SizedBox(height: 20),

    // ---------- Screenshots ----------
    if (movie.screenshots.isNotEmpty)
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Screenshots",
    style: theme.textTheme.headlineSmall,),
    const SizedBox(height: 10),
    SizedBox(
    height: 180,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: movie.screenshots.length,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (context, index) {
    return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.network(
    movie.screenshots[index],
    width: 300,
    fit: BoxFit.cover,
    ),
    );
    },
    ),
    ),
    ],
    ),
    ),

    const SizedBox(height: 20),

            // ---------- Similar Movies ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Similar",
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<MovieDetails>>(
                    future: similarMovies,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final similar = snapshot.data!;
                      return SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: similar.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final movieItem = similar[index];
                            final imageUrl = movieItem.screenshots.isNotEmpty
                                ? movieItem.screenshots[0]
                                : movieItem.image;

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(movieId: movieItem.id),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  imageUrl,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    const SizedBox(height: 20),

    // ---------- Summary ----------
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Summary",
    style: theme.textTheme.headlineSmall,),
      const SizedBox(height: 10),
      Text(
        movie.description,
        style:
        const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ],
    ),
    ),

            const SizedBox(height: 20),

            // ---------- Cast ----------
            if (movie.cast.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cast", style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: movie.cast.length,
                      itemBuilder: (context, index) {
                        final c = movie.cast[index];
                        return CustomCastMovieDetalis(
                          image: c.image,
                          title: c.name,
                          subtitle: c.character,
                        );
                      },
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // ---------- Genres ----------
            if (movie.genres.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genres",
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: movie.genres
                          .map((g) => CustomGenres(text: g))
                          .toList(),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 30),
          ],
        ),
      );
        },
        ),
    );
  }
}