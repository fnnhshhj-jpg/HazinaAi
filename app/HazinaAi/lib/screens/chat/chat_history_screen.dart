import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  final List<Map<String, String>> chatHistory = const [
    {
      "title": "Flutter haqida suhbat",
      "time": "Bugun, 14:30",
    },
    {
      "title": "AI Image Generator",
      "time": "Kecha, 19:10",
    },
    {
      "title": "PDF Summary",
      "time": "20-iyul, 10:45",
    },
    {
      "title": "Inglizcha tarjima",
      "time": "18-iyul, 21:15",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat History"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: chatHistory.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chatHistory[index];

          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.chat_bubble_outline),
            ),
            title: Text(chat["title"]!),
            subtitle: Text(chat["time"]!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pop(context, chat);
            },
          );
        },
      ),
    );
  }
}