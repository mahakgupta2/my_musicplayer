import 'package:app/presentation/getstartedpage.dart';
import 'package:app/presentation/sign%20up.dart';
import 'package:app/presentation/signin.dart';
import 'package:app/presentation/signup_or_signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app/presentation/service_locator.dart';

import 'package:app/presentation/splash.dart';
import 'package:app/homepage.dart';
import 'package:app/favoritepage.dart';
import 'package:app/searchpage.dart';
import 'package:app/musicpage.dart';
import 'package:app/profilepage.dart';
import 'package:app/data/models/auth/song_model.dart';
import 'package:app/data/models/auth/song_list.dart';

// ✅ Dummy Admin Page
class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: const Center(child: Text("Welcome Admin", style: TextStyle(fontSize: 24))),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();

  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),          // default route
        '/getStarted': (context) => const GetStartedPage(),
        '/signupOrsignin': (context) => const SignupOrSignin(),
        '/signup': (context) => const SignupPage(),
        '/signin': (context) => const SigninPage(),
        '/userHome': (context) => const PlayerPage(),
        '/adminDashboard': (context) => const AdminDashboardPage(),
      },
    );
  }
}

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  int _currentIndex = 0;

  final Song dummySong = songs[0];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const Favoritepage(),
      const Searchpage(),
      const Homepage(),
      MusicPage(song: dummySong),
      const ProfilePage(),
    ];
  }

  void _onTabTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
