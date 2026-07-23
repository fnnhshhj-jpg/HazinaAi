import 'package:flutter/material.dart';

class WriterScreen extends StatefulWidget {
  const WriterScreen({super.key});

  @override
  State<WriterScreen> createState() => _WriterScreenState();
}

class _WriterScreenState extends State<WriterScreen> {
  final TextEditingController _topicController =
      TextEditingController();

  final TextEditingController _outputController =
      TextEditingController();

  String _selectedType = "Maqola";

  bool _isLoading = false;

  final List<String> _types = [
    "Maqola",
    "Insho",
    "Email",
    "Hikoya",
    "Reja",
    "Reklama matni",
  ];

  Future<void> _createText() async {
    if (_topicController.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    // TODO:
    // OpenAI API / Gemini API ulash

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      _outputController.text =
          """
$_selectedType

Mavzu:
${_topicController.text}

AI Writer tomonidan yaratilgan matn.

Bu joyda haqiqiy sun'iy intellekt javobi chiqadi.
HazinaAI foydalanuvchiga professional va sifatli
matn yaratishda yordam beradi.
""";

      _isLoading = false;
    });
  }

  void _clearText() {
    _topicController.clear();
    _outputController.clear();
  }

  @override
  void dispose() {
    _topicController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HazinaAI Writer"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              DropdownButtonFormField<String>(
                value: _selectedType,

                decoration: const InputDecoration(
                  labelText: "Matn turi",
                  border: OutlineInputBorder(),
                ),

                items: _types.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _topicController,
                maxLines: 3,

                decoration: InputDecoration(
                  hintText:
                      "Mavzu yozing...",
                  prefixIcon:
                      const Icon(Icons.edit),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed:
                      _isLoading
                          ? null
                          : _createText,

                  icon: const Icon(
                    Icons.auto_awesome,
                  ),

                  label: Text(
                    _isLoading
                        ? "Yozilmoqda..."
                        : "AI bilan yozish",
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: TextField(
                  controller: _outputController,

                  expands: true,
                  maxLines: null,

                  readOnly: true,

                  decoration: InputDecoration(
                    hintText:
                        "Yaratilgan matn shu yerda chiqadi...",

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed:
                          _clearText,

                      icon: const Icon(
                        Icons.delete_outline,
                      ),

                      label:
                          const Text(
                            "Tozalash",
                          ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO:
                        // Clipboard copy
                      },

                      icon: const Icon(
                        Icons.copy,
                      ),

                      label:
                          const Text(
                            "Nusxalash",
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}