import 'package:flutter/material.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  bool _isLoading = false;

  String? _fileName;

  String _summary =
      "PDF tanlang. AI hujjatni o'qib, qisqacha mazmunini shu yerda ko'rsatadi.";

  Future<void> _pickPdf() async {
    // TODO:
    // file_picker package orqali PDF tanlash

    setState(() {
      _fileName = "sample_document.pdf";
    });
  }

  Future<void> _summarizePdf() async {
    if (_fileName == null) return;

    setState(() {
      _isLoading = true;
    });

    // TODO:
    // PDF matnini ajratib olish
    // OpenAI API orqali xulosa yaratish

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;

      _summary =
          "AI xulosasi:\n\n"
          "Ushbu PDF sun'iy intellekt texnologiyalari, ularning qo'llanilishi va kelajakdagi rivojlanishi haqida ma'lumot beradi.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF AI"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: [

                    const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                      size: 70,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      _fileName ?? "PDF tanlanmagan",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: _pickPdf,
                  icon: const Icon(Icons.upload_file),
                  label: const Text("PDF tanlash"),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed:
                      _fileName == null || _isLoading
                          ? null
                          : _summarizePdf,

                  icon: const Icon(Icons.auto_awesome),

                  label: Text(
                    _isLoading
                        ? "Tahlil qilinmoqda..."
                        : "AI xulosa yaratish",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: _isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Text(
                              _summary,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
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