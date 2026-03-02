import 'package:flutter/material.dart';
import '../widgets/home_tab.dart';
import '../widgets/profile_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> tabs = [
    const HomeTab(),
    Container(color: Colors.black),
    Container(color: Colors.black),
    const UpdateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: "",
          ),
        ],
      ),
      );

  }
}