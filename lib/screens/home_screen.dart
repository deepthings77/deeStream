import 'package:flutter/material.dart';
import 'package:twitch/screens/feed_screen.dart';
import 'package:twitch/screens/golivescreen.dart';
import 'package:twitch/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  List<Widget> pages = [
    const FeedScreen(),
    const GoLiveScreen(),
    const Center(
      child: Text( "More Features \nCOMING SOON....."),
    )
  ];
  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: onPageChange,
          selectedItemColor: buttonColor,
          unselectedFontSize: 12,
          unselectedItemColor: primaryColor,
          backgroundColor: backgroundColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Following'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_rounded), label: 'Go Live'),
            BottomNavigationBarItem(icon: Icon(Icons.copy), label: 'Browse'),
          ]),
      body: pages[_page],
    );
  }
}
