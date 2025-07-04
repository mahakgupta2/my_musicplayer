import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.purple,
                child: Text("M", style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
              const SizedBox(height: 12),
              const Text(
                "Mahak Gupta",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              const Text("View profile", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),

              // Menu Options
              ListTile(
                leading: const Icon(Icons.person_add_alt_1, color: Colors.white),
                title: const Text("Add account", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: const Icon(Icons.flash_on, color: Colors.white),
                title: const Text("What's new", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.white),
                title: const Text("Recents", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text("Settings and privacy", style: TextStyle(color: Colors.white)),
              ),

              const Spacer(),

              // 👇 Logout Option at Bottom
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    // TODO: Add logout logic
                    print("User Logged Out");
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text("Logout", style: TextStyle(color: Colors.yellow)),
                ),
              ),

              const SizedBox(height: 8),
              const Divider(color: Colors.white24),
              const Center(
                child: Text(
                  "Music Player App • by Harshit",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}