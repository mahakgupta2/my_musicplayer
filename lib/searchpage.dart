import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return DJMixScreen(

    );
  }
}


class DJMixScreen extends StatelessWidget {
  const DJMixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search ",
                hintStyle: const TextStyle(color: Colors.yellow),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text("Popular Songs", style: TextStyle(color: Colors.yellow, fontSize: 16,)),
            const SizedBox(height: 12),

            // Music List
            Expanded(
              child: ListView(
                children: const [
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/J5LVHEL.jpg',
                    title: 'The lost files',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/2yaf2wb.jpg',
                    title: 'Rockstar metro mix',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/y6xUdZR.jpg',
                    title: 'Get the first tip',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/BoN9kdC.png',
                    title: 'Most of the lost',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/2yaf2wb.jpg',
                    title: 'Rockstar metro mix',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/J5LVHEL.jpg',
                    title: 'Get the first tip',
                    artist: 'DJ Alvin',
                  ),
                  MusicTile(
                    imageUrl: 'https://i.imgur.com/y6xUdZR.jpg',
                    title: 'Most of the lost',
                    artist: 'DJ Alvin',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;

  const MusicTile({
    required this.imageUrl,
    required this.title,
    required this.artist,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(artist, style: const TextStyle(color: Colors.white60)),
      trailing: const Icon(Icons.play_circle_fill, color: Colors.yellow, size: 32),
    );
  }
}

