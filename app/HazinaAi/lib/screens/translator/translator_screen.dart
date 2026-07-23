import 'package:flutter/material.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() =>
      _TranslatorScreenState();
}

class _TranslatorScreenState
    extends State<TranslatorScreen> {

  final TextEditingController _inputController =
      TextEditingController();

  final TextEditingController _outputController =
      TextEditingController();


  String _fromLanguage = "O'zbekcha";
  String _toLanguage = "English";

  bool _isLoading = false;


  final List<String> _languages = [
    "O'zbekcha",
    "English",
    "Русский",
    "Deutsch",
    "Türkçe",
    "Arabcha",
    "Français",
    "中文",
  ];


  Future<void> _translate() async {

    if (_inputController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });


    // TODO:
    // Google Translate API
    // OpenAI Translation API


    await Future.delayed(
      const Duration(seconds: 2),
    );


    setState(() {

      _outputController.text =
          """
Tarjima natijasi:

${_inputController.text}

($_fromLanguage → $_toLanguage)

AI tarjimon tomonidan tayyorlandi.
""";

      _isLoading = false;

    });
  }


  void _swapLanguages() {

    setState(() {

      final temp = _fromLanguage;

      _fromLanguage = _toLanguage;

      _toLanguage = temp;

    });

  }


  @override
  void dispose() {

    _inputController.dispose();

    _outputController.dispose();

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "AI Translator",
            ),

        centerTitle: true,

      ),


      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(16),


          child: Column(

            children: [


              Row(

                children: [


                  Expanded(

                    child:
                        DropdownButtonFormField<String>(

                      value: _fromLanguage,

                      decoration:
                          const InputDecoration(

                        labelText:
                            "Dan",

                        border:
                            OutlineInputBorder(),

                      ),


                      items:
                          _languages.map((lang) {

                        return DropdownMenuItem(

                          value: lang,

                          child:
                              Text(lang),

                        );

                      }).toList(),


                      onChanged: (value) {

                        setState(() {

                          _fromLanguage =
                              value!;

                        });

                      },

                    ),

                  ),


                  IconButton(

                    onPressed:
                        _swapLanguages,

                    icon:
                        const Icon(
                          Icons.swap_horiz,
                          size: 35,
                        ),

                  ),


                  Expanded(

                    child:
                        DropdownButtonFormField<String>(

                      value: _toLanguage,

                      decoration:
                          const InputDecoration(

                        labelText:
                            "Ga",

                        border:
                            OutlineInputBorder(),

                      ),


                      items:
                          _languages.map((lang) {

                        return DropdownMenuItem(

                          value: lang,

                          child:
                              Text(lang),

                        );

                      }).toList(),


                      onChanged: (value) {

                        setState(() {

                          _toLanguage =
                              value!;

                        });

                      },

                    ),

                  ),

                ],

              ),


              const SizedBox(height: 20),


              Expanded(

                child:
                    TextField(

                  controller:
                      _inputController,

                  maxLines:
                      null,

                  expands:
                      true,


                  decoration:
                      InputDecoration(

                    hintText:
                        "Tarjima qilinadigan matn...",

                    border:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(15),

                    ),

                  ),

                ),

              ),


              const SizedBox(height: 15),


              SizedBox(

                width:
                    double.infinity,


                height:
                    55,


                child:
                    ElevatedButton.icon(

                  onPressed:
                      _isLoading
                          ? null
                          : _translate,


                  icon:
                      const Icon(
                        Icons.translate,
                      ),


                  label:
                      Text(

                    _isLoading

                        ? "Tarjima qilinmoqda..."

                        : "Tarjima qilish",

                  ),

                ),

              ),


              const SizedBox(height: 15),


              Expanded(

                child:
                    TextField(

                  controller:
                      _outputController,


                  readOnly:
                      true,


                  maxLines:
                      null,


                  expands:
                      true,


                  decoration:
                      InputDecoration(

                    hintText:
                        "Tarjima natijasi...",


                    border:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(15),

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