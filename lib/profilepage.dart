import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/presentation/signup_or_signin.dart';
import 'package:app/SettingsPage.dart';
import 'package:app/whatsnew.dart'; // <-- Add this file

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    String getInitial() {
      if (user?.displayName?.isNotEmpty ?? false) {
        return user!.displayName![0].toUpperCase();
      } else if (user?.email?.isNotEmpty ?? false) {
        return user!.email![0].toUpperCase();
      }
      return "U";
    }

    String getDisplayName() {
      return user?.displayName ?? user?.email ?? "Unknown User";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔰 Profile Avatar
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.purple,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : null,
                child: user?.photoURL == null
                    ? Text(
                  getInitial(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                )
                    : null,
              ),

              const SizedBox(height: 12),
              Text(
                getDisplayName(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),

              Text(
                user?.email ?? "No email",
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // 🆕 What's New
              _buildMenuItem(
                context,
                icon: Icons.flash_on,
                title: "What's new",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WhatsNewPage(),
                    ),
                  );
                },
              ),
              // ⚙️ Settings and Privacy
              _buildMenuItem(
                context,
                icon: Icons.settings,
                title: "Settings and privacy",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPage(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // 🚪 Logout Button with Confirmation
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          title: const Text("Confirm Logout",
                              style: TextStyle(color: Colors.yellow)),
                          content: const Text(
                            "Are you sure you want to logout?",
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("No",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await FirebaseAuth.instance.signOut();
                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupOrSignin(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Logged out")),
                                  );
                                }
                              },
                              child: const Text("Yes",
                                  style: TextStyle(color: Colors.redAccent)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text("Logout",
                      style: TextStyle(color: Colors.yellow)),
                ),
              ),

              const SizedBox(height: 8),
              const Divider(color: Colors.white24),

              // 📌 Footer
              const Center(
                child: Text(
                  "Music Player App • by Mahak Gupta",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String title, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap ?? () => debugPrint("Tapped on $title"),
    );
  }
}
