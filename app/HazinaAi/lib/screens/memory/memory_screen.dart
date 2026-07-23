import 'package:flutter/material.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  final TextEditingController _memoryController =
      TextEditingController();

  final List<String> _memories = [
    "Mening ismim Ali.",
    "Men Flutter dasturchisiman.",
    "Ingliz tilini o'rganmoqdaman.",
  ];

  void _addMemory() {
    final text = _memoryController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _memories.insert(0, text);
    });

    _memoryController.clear();
  }

  void _deleteMemory(int index) {
    setState(() {
      _memories.removeAt(index);
    });
  }

  @override
  void dispose() {
    _memoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Memory"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _memoryController,
              decoration: InputDecoration(
                hintText: "Eslab qolish uchun ma'lumot kiriting...",
                prefixIcon: const Icon(Icons.memory),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addMemory,
                icon: const Icon(Icons.add),
                label: const Text("Xotiraga saqlash"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _memories.isEmpty
                  ? const Center(
                      child: Text(
                        "Hozircha xotiralar mavjud emas.",
                      ),
                    )
                  : ListView.builder(
                      itemCount: _memories.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.psychology),
                            ),
                            title: Text(_memories[index]),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _deleteMemory(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}