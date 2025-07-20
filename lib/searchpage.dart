import 'package:flutter/material.dart';
import 'package:app/musicpage.dart';
import 'package:app/data/models/auth/song_model.dart';
import 'package:app/favorites_store.dart'; // ✅ Import for favorite logic

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _controller = TextEditingController();
  List<Song> allSongs = [];
  List<Song> filteredSongs = [];

  @override
  void initState() {
    super.initState();

    // ✅ Song list: All from Cloudinary
    allSongs = [
      Song(
        title: 'The Lost Files',
        subtitle: 'DJ Alvin',
        year: '2021',
        imageUrl: 'https://i.imgur.com/J5LVHEL.jpg',
        audioUrl:
        'https://res.cloudinary.com/dawjttakh/video/upload/v1752345880/Tu_Hai_To_Mujhe_Fir_Aur_Kya_Chahiye__Slowed___Reverb__Lofi_Ringtone___Love_Ringtone___New_Ringtone__256k_sc6s4y.mp3',
      ),
      Song(
        title: 'Rockstar Metro Mix',
        subtitle: 'DJ Alvin',
        year: '2022',
        imageUrl: 'https://i.imgur.com/2yaf2wb.jpg',
        audioUrl:
        'https://res.cloudinary.com/dawjttakh/video/upload/v1752387585/Haqeeqat_Akhil_Sachdeva_320_Kbps_b8m8hs.mp3',
      ),
      Song(
        title: 'Get the First Tip',
        subtitle: 'DJ Alvin',
        year: '2022',
        imageUrl: 'https://i.imgur.com/y6xUdZR.jpg',
        audioUrl:
        'https://res.cloudinary.com/dawjttakh/video/upload/v1752387522/Tum_Ho_Toh_Saiyaara_320_Kbps_it7faa.mp3',
      ),
      Song(
        title: 'Most of the Lost',
        subtitle: 'DJ Alvin',
        year: '2023',
        imageUrl: 'https://i.imgur.com/BoN9kdC.png',
        audioUrl:
        'https://res.cloudinary.com/dawjttakh/video/upload/v1752387677/Pehla_Tu_Duja_Tu_Son_Of_Sardaar_2_320_Kbps_czvarv.mp3',
      ),
      Song(
        title: 'Dummy Song',
        subtitle: 'Test',
        year: '2023',
        imageUrl: 'https://i.imgur.com/BoN9kdC.png',
        audioUrl: '',
      ),
    ];

    filteredSongs = allSongs
        .where((song) => song.audioUrl.contains('res.cloudinary.com'))
        .toList();

    // ✅ Auto-refresh when favorite updates
    FavoritesStore.instance.listenable.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  void _filterSongs(String query) {
    setState(() {
      filteredSongs = allSongs
          .where((song) =>
      song.audioUrl.contains('res.cloudinary.com') &&
          (song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.subtitle.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    FavoritesStore.instance.listenable.removeListener(_refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                onChanged: _filterSongs,
                decoration: InputDecoration(
                  hintText: "Search songs ",
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
              const Text("Jovial Songs",
                  style: TextStyle(color: Colors.yellow, fontSize: 16)),
              const SizedBox(height: 12),

              // 🎵 Music List
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSongs.length,
                  itemBuilder: (context, index) {
                    final song = filteredSongs[index];
                    return MusicTile(song: song);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicTile extends StatelessWidget {
  final Song song;

  const MusicTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final isFav = FavoritesStore.instance.contains(song);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(song.imageUrl,
            width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(song.title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(song.subtitle,
          style: const TextStyle(color: Colors.white60)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.play_circle_fill,
                color: Colors.yellow, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MusicPage(song: song)),
              );
            },
          ),
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.white60,
            ),
            onPressed: () {
              FavoritesStore.instance.toggle(song);
            },
          ),
        ],
      ),
    );
  }
}
