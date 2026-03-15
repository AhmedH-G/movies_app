import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/models/user_data_model.dart';
import 'package:movies/core/utils/firebase_auth_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../core/widgets/custom_movie_detalis.dart';
import '../../movie_details/movie_details_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  UserDataModel? userModel;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    EasyLoading.show(status: 'Loading Profile...');
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var data = await FirebaseAuthUtils.getUserFromFireStore(uid);
      if (data != null) {
        setState(() {
          userModel = data;
        });
      }
      EasyLoading.dismiss();

  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    if (userModel == null) {
      return Scaffold(backgroundColor: ColorPallete.backgroundColorBlack);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: ColorPallete.backgroundColorBlack,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 22.0, top: 70),
                    child: Row(
                      spacing: 25,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          spacing: 15,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: userModel!.avatarUrl.startsWith('assets')
                                  ? AssetImage(userModel!.avatarUrl) as ImageProvider
                                  : NetworkImage(userModel!.avatarUrl),
                            ),
                            Text(
                              userModel!.name,
                              style: theme.textTheme.titleMedium?.copyWith(fontFamily: "Roboto"),
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                            spacing: 25,
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection("UserCollection").doc(userModel!.uId).collection("WatchlistCollection").snapshots(),
                                builder: (context, snap) => _userState("${snap.data?.docs.length ?? 0}", "Wish List", theme),
                              ),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection("UserCollection").doc(userModel!.uId).collection("HistoryCollection").snapshots(),
                                builder: (context, snap) => _userState("${snap.data?.docs.length ?? 0}", "History", theme),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                            bottonText: "Edit Profile",
                            onPressed: () {
                              Navigator.pushNamed(context, PageRouteName.updateScreen).then((_) {
                                _fetchUserData();
                              });
                            },
                            backgroundColor: ColorPallete.primaryColor,
                            bordarColor: ColorPallete.primaryColor,
                            fontType: "Roboto",
                            textColor: ColorPallete.colorBlack,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomElevatedButton(
                            bottonText: "Exit",
                            onPressed: () async {
                              final navigator = Navigator.of(context);
                              await FirebaseAuth.instance.signOut();
                              navigator.pushReplacementNamed(PageRouteName.singIn);
                            },
                            backgroundColor: ColorPallete.buttonRedColor,
                            bordarColor: ColorPallete.buttonRedColor,
                            fontType: "Roboto",
                            textColor: ColorPallete.generalTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TabBar(
                    indicatorColor: ColorPallete.primaryColor,
                    labelStyle: theme.textTheme.titleMedium?.copyWith(fontFamily: "Roboto"),
                    unselectedLabelColor: ColorPallete.generalTextColor,
                    labelColor: ColorPallete.generalTextColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelPadding: const EdgeInsets.only(bottom: 15),
                    tabs: [
                      Tab(icon: Assets.icons.list.svg(), text: "Watch List", iconMargin: const EdgeInsets.only(bottom: 10)),
                      Tab(icon: Assets.icons.folder.svg(), text: "History", iconMargin: const EdgeInsets.only(bottom: 10))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _moviesGrid("WatchlistCollection"),
                  _moviesGrid("HistoryCollection"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userState(String count, String label, ThemeData theme) {
    return Column(
      spacing: 15,
      children: [
        Text(count, style: theme.textTheme.headlineLarge?.copyWith(fontFamily: "Roboto", fontWeight: FontWeight.w700)),
        Text(label, style: theme.textTheme.titleMedium?.copyWith(fontFamily: "Roboto", fontSize: 22)),
      ],
    );
  }

  Widget _moviesGrid(String collectionName) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("UserCollection")
          .doc(userModel!.uId)
          .collection(collectionName)
          .orderBy(collectionName == "WatchlistCollection" ? "addedAt" : "viewedAt", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: ColorPallete.primaryColor));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Assets.images.popcorn.image(height: 124, width: 124));
        }

        final movies = snapshot.data!.docs;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 122 / 180,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movieData = movies[index].data() as Map<String, dynamic>;

            return CustomFilmCard(
              rating: movieData['rating'].toString(),
              imageUrl: movieData['image'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      movieId: movieData['id'],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}