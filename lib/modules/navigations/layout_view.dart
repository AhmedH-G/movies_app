import 'package:flutter/material.dart';
import 'home/home_tab.dart';
import 'search/search_tab.dart';
import 'explore/explore_tab.dart';
import 'profile/profile_tab.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  final List<Widget> tabs = const [
    HomeTab(),
    SearchScreen(),
    ExploreTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: tabs[currentIndex],

      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff1A1A1A),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,

          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: const Color(0xffF6BD0E),
          unselectedItemColor: Colors.grey[400],

          showSelectedLabels: false,
          showUnselectedLabels: false,

          onTap: (index) => setState(() => currentIndex = index),

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 28), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 28), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 28), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 28), label: ""),
          ],
        ),
        ///////
      ),
    );
  }
}