import 'package:flutter/material.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() =>
      _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState
    extends State<ImageGeneratorScreen> {

  final TextEditingController _promptController =
      TextEditingController();

  String? generatedImage;

  bool isLoading = false;


  void _generateImage() async {
    final prompt = _promptController.text.trim();

    if (prompt.isEmpty) return;

    setState(() {
      isLoading = true;
    });


    // TODO:
    // AI Image API ulash
    // OpenAI / Stable Diffusion / Firebase Function


    await Future.delayed(
      const Duration(seconds: 2),
    );


    setState(() {
      generatedImage =
          "https://via.placeholder.com/400x400.png?text=AI+Image";
      isLoading = false;
    });
  }


  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "AI Image Generator",
        ),
        centerTitle: true,
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              TextField(
                controller: _promptController,

                maxLines: 3,

                decoration: InputDecoration(
                  hintText:
                      "Rasm uchun tavsif yozing...",
                  
                  prefixIcon:
                      const Icon(Icons.image),

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),


              const SizedBox(height: 20),


              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed:
                      isLoading
                          ? null
                          : _generateImage,

                  icon: const Icon(
                    Icons.auto_awesome,
                  ),

                  label: Text(
                    isLoading
                        ? "Yaratilmoqda..."
                        : "Rasm yaratish",
                  ),
                ),
              ),


              const SizedBox(height: 30),


              Expanded(
                child: Center(

                  child: isLoading

                      ? const CircularProgressIndicator()


                      : generatedImage == null

                          ? Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,

                              children: const [
                                Icon(
                                  Icons.image_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "AI rasm yaratish uchun\n"
                                  "yuqoriga tavsif yozing",
                                  textAlign:
                                      TextAlign.center,
                                ),
                              ],
                            )


                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(20),

                              child: Image.network(
                                generatedImage!,

                                fit: BoxFit.cover,

                                width: 350,
                                height: 350,
                              ),
                            ),
                ),
              ),


              if (generatedImage != null)
                ElevatedButton.icon(

                  onPressed: () {

                    // TODO:
                    // Galereyaga saqlash

                  },

                  icon:
                      const Icon(
                        Icons.download,
                      ),

                  label:
                      const Text(
                        "Saqlash",
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}