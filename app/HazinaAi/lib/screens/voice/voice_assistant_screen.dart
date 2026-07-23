import 'package:flutter/material.dart';

class VoiceAssistantScreen extends StatefulWidget {
  const VoiceAssistantScreen({super.key});

  @override
  State<VoiceAssistantScreen> createState() =>
      _VoiceAssistantScreenState();
}

class _VoiceAssistantScreenState extends State<VoiceAssistantScreen> {
  bool _isListening = false;

  String _recognizedText = "Mikrofon tugmasini bosing va gapiring.";

  String _aiResponse = "AI javobi shu yerda ko'rinadi.";

  void _toggleListening() async {
    setState(() {
      _isListening = !_isListening;
    });

    if (_isListening) {
      // TODO:
      // SpeechToText boshlash

      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        _recognizedText = "Salom HazinaAI";
        _aiResponse =
            "Assalomu alaykum! Sizga qanday yordam bera olaman?";
        _isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Assistant"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              CircleAvatar(
                radius: 60,
                backgroundColor:
                    _isListening ? Colors.red : Colors.blue,
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                _isListening
                    ? "Tinglanmoqda..."
                    : "Mikrofonga gapiring",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        "Siz aytdingiz:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _recognizedText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        "HazinaAI javobi:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _aiResponse,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _toggleListening,
                  icon: Icon(
                    _isListening ? Icons.stop : Icons.mic,
                  ),
                  label: Text(
                    _isListening
                        ? "To'xtatish"
                        : "Gapirishni boshlash",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}