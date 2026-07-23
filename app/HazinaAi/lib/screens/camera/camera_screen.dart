import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isLoading = false;

  String _aiResult = "Rasm tahlili shu yerda ko'rinadi.";

  ImageProvider? _selectedImage;

  Future<void> _pickImage() async {
    // TODO:
    // image_picker orqali kamera yoki galereyadan rasm tanlash

    setState(() {
      _selectedImage = const AssetImage(
        "assets/images/sample.jpg",
      );
    });
  }

  Future<void> _analyzeImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isLoading = true;
    });

    // TODO:
    // OpenAI Vision yoki Gemini Vision API

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _aiResult =
          "AI natijasi:\n\nBu rasmda stol ustida noutbuk, telefon va qahva chashkasi mavjud.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Camera"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _selectedImage == null
                      ? const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 80,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Rasm tanlanmagan",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(16),
                          child: Image(
                            image: _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.photo_camera),
                  label: const Text("Rasm tanlash"),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      _selectedImage == null || _isLoading
                          ? null
                          : _analyzeImage,
                  icon: const Icon(Icons.auto_awesome),
                  label: Text(
                    _isLoading
                        ? "Tahlil qilinmoqda..."
                        : "AI bilan tahlil qilish",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              if (_isLoading)
                const CircularProgressIndicator()
              else
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        _aiResult,
                        style: const TextStyle(fontSize: 16),
                      ),
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