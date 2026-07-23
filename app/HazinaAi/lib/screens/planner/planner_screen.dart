import 'package:flutter/material.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final TextEditingController _taskController =
      TextEditingController();

  final List<Map<String, dynamic>> _tasks = [];

  void _addTask() {
    final task = _taskController.text.trim();

    if (task.isEmpty) return;

    setState(() {
      _tasks.add({
        "title": task,
        "completed": false,
      });
    });

    _taskController.clear();
  }

  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index]["completed"] = value ?? false;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planner"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Yangi vazifa...",
                prefixIcon: const Icon(Icons.event_note),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => _addTask(),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addTask,
                icon: const Icon(Icons.add_task),
                label: const Text("Vazifa qo'shish"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "Hozircha rejalashtirilgan vazifalar yo'q.",
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];

                        return Card(
                          margin:
                              const EdgeInsets.only(bottom: 10),
                          child: CheckboxListTile(
                            value: task["completed"],
                            onChanged: (value) =>
                                _toggleTask(index, value),
                            title: Text(
                              task["title"],
                              style: TextStyle(
                                decoration: task["completed"]
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            secondary: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _deleteTask(index),
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