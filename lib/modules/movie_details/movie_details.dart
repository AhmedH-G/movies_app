import 'package:flutter/material.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/widgets/custom_movie_detalis.dart';
import '../../core/widgets/custom_elevated_button.dart';

import '../../core/widgets/movie_info_card_widget.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<StatefulWidget> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //------Large Cover from API---------//
                Image.network(
                  "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/large-cover.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.6,
                ),
                Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorPallete.colorBlack.withValues(alpha: 0.2),
                        ColorPallete.colorBlack,
                      ],
                      stops: [0.0, 0.9],
                    ),
                  ),
                ),
                //------First Part of Movie Details Movie Info---------//
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //------Back Arrow and Book mark---------//
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              isSelected
                                  ? Icons.bookmark_border_rounded
                                  : Icons.bookmark_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //------Video Play Button---------//
                    SizedBox(height: 150),
                    GestureDetector(
                      onTap: () {},
                      child: Assets.images.videoPlay.image(),
                    ),
                    //------Movie title and Year from API---------//
                    SizedBox(height: 120),
                    Text(
                      "500 Days of Summer",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "2009",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorPallete.colorGrey,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //------Watch Button to API URL---------//
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            //------Likes, Time and Rate Cards from API---------//
            SizedBox(height: 15),
            Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                MovieInfoCardWidget(
                  label: '289',
                  iconAsset: Assets.icons.likes,
                ),
                MovieInfoCardWidget(label: '95', iconAsset: Assets.icons.time),
                MovieInfoCardWidget(label: '7.6', iconAsset: Assets.icons.rate),
              ],
            ),
            //------Second Part of Movie Details Screenshots---------//
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Screen Shots",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      List<String> screenShots = [
                        "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/medium-screenshot1.jpg",
                        "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/medium-screenshot2.jpg",
                        "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/medium-screenshot3.jpg",
                      ];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          screenShots[index],
                          height: 167,
                          width: 398,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            //------Third Part of Movie Details Similar from API---------//
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Similar",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return CustomFilmCard(
                        rating: "7.7",
                        imageUrl:
                            "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/large-cover.jpg",
                      );
                    },
                  ),
                ],
              ),
            ),
            //------Four Part of Movie Details Summary---------//
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Summary",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 400,
                    child: Text(
                      "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            //------Five Part of Movie Details Cast---------//
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cast",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomCastMovieDetalis(
                    image: Assets.images.logo.path,
                    title: "Name : Hayley Atwel",
                    subtitle: "Character : Captain Carter",
                  ),
                  SizedBox(height: 5),
                  CustomCastMovieDetalis(
                    image: Assets.images.logo.path,
                    title: "Name : Hayley Atwel",
                    subtitle: "Character : Captain Carter",
                  ),
                  SizedBox(height: 5),
                  CustomCastMovieDetalis(
                    image: Assets.images.logo.path,
                    title: "Name : Hayley Atwel",
                    subtitle: "Character : Captain Carter",
                  ),
                  SizedBox(height: 5),
                  CustomCastMovieDetalis(
                    image: Assets.images.logo.path,
                    title: "Name : Hayley Atwel",
                    subtitle: "Character : Captain Carter",
                  ),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 4,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 16,
                  //     mainAxisSpacing: 16,
                  //     childAspectRatio: 0.7,
                  //   ),
                  //   itemBuilder: (context, index) {
                  //     return CustomFilmCard(
                  //       rating: "7.7",
                  //       imageUrl:
                  //       "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/large-cover.jpg",
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            //------Six Part of Movie Details Cast---------//
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Genres",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: [
                      CustomGenres(text: "Action"),
                      CustomGenres(text: "Sci-Fi"),
                      CustomGenres(text: "Adventure"),
                      CustomGenres(text: "Fantasy"),
                      CustomGenres(text: "Horror"),

                    ],
                  )

                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 4,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 16,
                  //     mainAxisSpacing: 16,
                  //     childAspectRatio: 0.7,
                  //   ),
                  //   itemBuilder: (context, index) {
                  //     return CustomFilmCard(
                  //       rating: "7.7",
                  //       imageUrl:
                  //       "https://img.yts.bz/assets/images/movies/500_Days_of_Summer_2009/large-cover.jpg",
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
