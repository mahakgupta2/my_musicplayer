import 'package:app/favoritepage.dart';
import 'package:app/homepage.dart';
import 'package:app/musicpage.dart';
import 'package:app/presentation/root.dart';
import 'package:app/presentation/service_locator.dart';
import 'package:app/presentation/splash.dart';
import 'package:app/profilepage.dart';
import 'package:app/searchpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          :await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MusicPlayerApp());
}

Future<void> initizeDependecies() async {
}

Future getApplicationDocumentsDirectory() async {
}

class HydratedStorage {
  static get webStorageDirectory {
    // TODO: implement webStorageDirectory
    throw UnimplementedError();
  }

  static Future build({required storageDirectory}) async {}
}

class HydratedBloc {
  static var storage;
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
    RootPage(),
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


