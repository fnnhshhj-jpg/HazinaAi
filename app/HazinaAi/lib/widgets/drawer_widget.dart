import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.smart_toy,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "HazinaAI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "AI Assistant",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(
                    context,
                    icon: Icons.home,
                    title: "Home",
                    route: "/home",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.chat,
                    title: "AI Chat",
                    route: "/chat",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.image,
                    title: "Image Generator",
                    route: "/image",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.mic,
                    title: "Voice AI",
                    route: "/voice",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.translate,
                    title: "Translator",
                    route: "/translator",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.picture_as_pdf,
                    title: "PDF",
                    route: "/pdf",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.person,
                    title: "Profile",
                    route: "/profile",
                  ),
                  _drawerItem(
                    context,
                    icon: Icons.settings,
                    title: "Settings",
                    route: "/settings",
                  ),
                ],
              ),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}