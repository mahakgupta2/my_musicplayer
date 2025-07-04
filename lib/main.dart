import 'package:app/core/configs/theme/app_theme.dart';
import 'package:app/favoritepage.dart';
import 'package:app/homepage.dart';
import 'package:app/musicpage.dart';
import 'package:app/presentation/splash.dart';
import 'package:app/profilepage.dart';
import 'package:app/searchpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashPage(

      ),
    );
  }
}

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Favoritepage(),
    Searchpage(),
    Homepage(),
    Musicpage(),
    ProfilePage(),
    SplashPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTabTapped,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.music_note_outlined), label: "Music"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
        ),
    );
  }
}


