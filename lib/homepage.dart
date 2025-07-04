import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with image
              Stack(
                children: [
                  Image.network(
                    'https://www.koimoi.com/wp-content/new-galleries/2016/02/sanam-teri-kasam-review-2.jpg',
                    width: double.infinity,
                    height: 700,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A.L.O.N.E',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Text("Subscribe"),
                        )
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),

              // Discography Section
              _buildSectionTitle("Discography"),
              _buildImageRow([
                {'img': 'https://i.scdn.co/image/ab67616d0000b2736539071e0f1833190a491d4d', 'title': 'Dead inside', 'year': '2019'},
                {'img': 'https://www.koimoi.com/wp-content/new-galleries/2016/02/sanam-teri-kasam-review-2.jpg', 'title': 'Alone', 'year': '2016'},
                {'img': 'https://img.youtube.com/vi/fs7-8M1VbZU/sddefault.jpg', 'title': 'Heartless', 'year': '2015'},
              ]),

              _buildSectionTitle("Popular Singers"),

              _buildSongListTile(
                title: "Arijit Singh",
                subtitle: "2023 • O Mahi",
                img: 'https://artistbookingcompany.com/wp-content/uploads/2024/03/arjit-singh.png',
              ),
              _buildSongListTile(
                title: "Shreya Ghoshal",
                subtitle: "2024 • Angaaron",
                img: 'https://d3lzcn6mbbadaf.cloudfront.net/media/details/ANI-20230824155330.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
          Text("See all", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildImageRow(List<Map<String, String>> items) {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(item['img']!, height: 100, width: 120, fit: BoxFit.cover),
                ),
                SizedBox(height: 8),
                Text(item['title']!, style: TextStyle(color: Colors.white)),
                Text(item['year']!, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSongListTile({
    required String title,
    required String subtitle,
    required String img,
  }) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(img, height: 50, width: 50, fit: BoxFit.cover),
      ),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert, color: Colors.white),
    );
  }
}
