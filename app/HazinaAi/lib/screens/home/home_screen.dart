import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/feature_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        break;

      case 1:
        Navigator.pushNamed(context, "/chat");
        break;

      case 2:
        Navigator.pushNamed(context, "/image");
        break;

      case 3:
        Navigator.pushNamed(context, "/memory");
        break;

      case 4:
        Navigator.pushNamed(context, "/profile");
        break;
    }
  }

  Widget buildFeature({
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: FeatureCard(
        title: title,
        subtitle: subtitle,
        icon: icon,
        color: color,
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HazinaAI",
        showBackButton: false,
      ),

      drawer: const DrawerWidget(),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.indigo,
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "👋 Welcome",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "HazinaAI Assistant",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "What would you like to do today?",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            buildFeature(
              title: "AI Chat",
              subtitle: "Chat with HazinaAI",
              icon: Icons.chat,
              route: "/chat",
              color: Colors.blue,
            ),

            buildFeature(
              title: "Image Generator",
              subtitle: "Create AI images",
              icon: Icons.image,
              route: "/image",
              color: Colors.purple,
            ),

            buildFeature(
              title: "Voice Assistant",
              subtitle: "Talk with AI",
              icon: Icons.mic,
              route: "/voice",
              color: Colors.orange,
            ),

            buildFeature(
              title: "Camera AI",
              subtitle: "Analyze photos",
              icon: Icons.camera_alt,
              route: "/camera",
              color: Colors.green,
            ),

            buildFeature(
              title: "PDF Assistant",
              subtitle: "Read & summarize PDF",
              icon: Icons.picture_as_pdf,
              route: "/pdf",
              color: Colors.red,
            ),

            buildFeature(
              title: "AI Writer",
              subtitle: "Generate articles",
              icon: Icons.edit_document,
              route: "/writer",
              color: Colors.teal,
            ),

            buildFeature(
              title: "Translator",
              subtitle: "Translate instantly",
              icon: Icons.translate,
              route: "/translator",
              color: Colors.deepPurple,
            ),

            buildFeature(
              title: "Planner",
              subtitle: "Plan your tasks",
              icon: Icons.calendar_month,
              route: "/planner",
              color: Colors.indigo,
            ),

            buildFeature(
              title: "Reminder",
              subtitle: "Manage reminders",
              icon: Icons.notifications,
              route: "/reminder",
              color: Colors.amber,
            ),

            buildFeature(
              title: "Memory",
              subtitle: "Saved AI memories",
              icon: Icons.memory,
              route: "/memory",
              color: Colors.cyan,
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}