import 'package:flutter/material.dart';

class Musicpage extends StatelessWidget {
  const Musicpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Artwork
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://i.scdn.co/image/ab67616d0000b2736539071e0f1833190a491d4d',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Alone in the Abyss",
            style: TextStyle(
              fontSize: 22,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Youlakou",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          const Icon(Icons.share, color: Colors.amber, size: 20),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Text("Dynamic Warmup", style: TextStyle(color: Colors.white70)),
                Spacer(),
                Text("4 min", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Slider(
            value: 0.3,
            onChanged: (value) {},
            activeColor: Colors.amber,
            inactiveColor: Colors.white24,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.loop, color: Colors.white),
              Icon(Icons.skip_previous, size: 36, color: Colors.white),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
                child: Icon(Icons.play_arrow, size: 36, color: Colors.black),
              ),
              Icon(Icons.skip_next, size: 36, color: Colors.white),
              Icon(Icons.volume_up, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}