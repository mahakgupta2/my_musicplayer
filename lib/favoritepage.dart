import 'package:flutter/material.dart';

void main() => runApp(const Favoritepage());

class Favoritepage extends StatelessWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MusicPlayerScreen(),
    );
  }
}


class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Favorite', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 3),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage('https://c.ndtvimg.com/2020-06/s3p53j98_asim_625x300_11_June_20.jpg?downsize=545:307'),// Replace with your asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("3:15 | 4:26", style: TextStyle(color: Colors.white54)),
          const SizedBox(height: 8),
          const Text("Black or White",
              style: TextStyle(color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold)),
          const Text("Michael Jackson  ·  Album - Dangerous",
              style: TextStyle(color: Colors.white60)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.skip_previous, color: Colors.white, size: 40),
              Icon(Icons.skip_next, color: Colors.white, size: 40),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: const [
                SongTile("Khayaal Rakhya kar", "Preetinder,Rajat Nagpal",""),
                SongTile("Be the girl", "Bebe Rexa", "assets/user2.jpg"),
                SongTile("Countryman", "Daughtry", "assets/user3.jpg"),
                SongTile("Do you believe in loneliness", "Marc Anthony", "assets/user4.jpg"),
                SongTile("Earth song", "Michael Jackson", "assets/user5.jpg"),
                SongTile("Smooth criminal", "Michael Jackson", "assets/user6.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  final String title;
  final String artist;
  final String image;

  const SongTile(this.title, this.artist, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(artist, style: const TextStyle(color: Colors.white60)),
      trailing: const Icon(Icons.play_circle_fill, color: Colors.yellow),
    );
  }
}

