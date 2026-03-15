import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/modules/navigations/profile/profile_tab.dart';
import 'home/home_tab.dart';
import 'search/search_tab.dart';


class LayoutView extends StatefulWidget {
   const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  final List<Widget> tabs = [
    const HomeTab(),
    const SearchScreen(),
    Container(color: Colors.black),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          SystemNavigator.pop();
        }
      },

      child: Scaffold(
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
      ),
    );
  }
}