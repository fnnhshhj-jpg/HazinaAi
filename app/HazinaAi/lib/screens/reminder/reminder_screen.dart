import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController _titleController =
      TextEditingController();

  final List<Map<String, dynamic>> _reminders = [];

  TimeOfDay? _selectedTime;

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _addReminder() {
    final title = _titleController.text.trim();

    if (title.isEmpty || _selectedTime == null) return;

    setState(() {
      _reminders.add({
        "title": title,
        "time": _selectedTime!.format(context),
      });
    });

    _titleController.clear();
    _selectedTime = null;
  }

  void _deleteReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminder"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Eslatma matni",
                prefixIcon: const Icon(Icons.notifications),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _pickTime,
                icon: const Icon(Icons.access_time),
                label: Text(
                  _selectedTime == null
                      ? "Vaqtni tanlash"
                      : _selectedTime!.format(context),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addReminder,
                icon: const Icon(Icons.add_alert),
                label: const Text("Eslatma qo'shish"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _reminders.isEmpty
                  ? const Center(
                      child: Text(
                        "Hozircha eslatmalar yo'q.",
                      ),
                    )
                  : ListView.builder(
                      itemCount: _reminders.length,
                      itemBuilder: (context, index) {
                        final reminder = _reminders[index];

                        return Card(
                          margin:
                              const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.alarm),
                            ),
                            title: Text(reminder["title"]),
                            subtitle: Text(
                              "⏰ ${reminder["time"]}",
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _deleteReminder(index),
                            ),
                          ),
                        );