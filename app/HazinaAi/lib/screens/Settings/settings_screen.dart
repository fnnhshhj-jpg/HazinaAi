import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _voiceResponse = true;
  bool _saveHistory = true;

  String _language = "O'zbek";

  final List<String> _languages = [
    "O'zbek",
    "English",
    "Русский",
    "Deutsch",
    "Türkçe",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sozlamalar"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Umumiy",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Qorong'i rejim"),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text("Bildirishnomalar"),
              value: _notifications,
              onChanged: (value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.record_voice_over),
              title: const Text("Ovozli javob"),
              value: _voiceResponse,
              onChanged: (value) {
                setState(() {
                  _voiceResponse = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.history),
              title: const Text("Chat tarixini saqlash"),
              value: _saveHistory,
              onChanged: (value) {
                setState(() {
                  _saveHistory = value;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: _language,
            decoration: const InputDecoration(
              labelText: "Ilova tili",
              border: OutlineInputBorder(),
            ),
            items: _languages.map((language) {
              return DropdownMenuItem(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _language = value!;
              });
            },
          ),

          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Sozlamalar saqlandi.",
                  ),
                ),
              );

              // TODO:
              // SharedPreferences yoki Firebase'da saqlash
            },
            icon: const Icon(Icons.save),
            label: const Text("Sozlamalarni saqlash"),
          ),

          const SizedBox(height: 20),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Ilova haqida"),
            subtitle: const Text("HazinaAI v1.0.0"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "HazinaAI",
                applicationVersion: "1.0.0",
                applicationLegalese: "© 2026 HazinaAI",
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Maxfiylik siyosati"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO:
              // Privacy Policy sahifasi
            },
          ),

          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text("Foydalanish shartlari"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO:
              // Terms & Conditions sahifasi
            },
          ),
        ],
      ),
    );
  }
}