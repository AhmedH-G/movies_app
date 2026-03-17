import 'package:flutter/material.dart';
import 'package:movies/modules/navigations/explore/explore_tab.dart';
import 'package:movies/modules/navigations/profile/profile_tab.dart';
import 'package:movies/modules/navigations/profile/update_screen.dart';
import 'home/home_tab.dart';
import 'search/search_tab.dart';


class LayoutView extends StatefulWidget {
   LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  final List<Widget> tabs = [
    const HomeTab(),
    const SearchScreen(),
    const ExploreTab(),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1A1A1A),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffF6BD0E),
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 28), label: ""),
        ],
      ),
    );
  }
}