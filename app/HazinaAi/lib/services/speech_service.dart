import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  SpeechService._();

  static final SpeechService instance = SpeechService._();

  final SpeechToText _speech = SpeechToText();

  bool _isInitialized = false;

  Future<bool> init() async {
    _isInitialized = await _speech.initialize();
    return _isInitialized;
  }

  bool get isListening => _speech.isListening;

  Future<void> startListening({
    required Function(String text) onResult,
    String localeId = "en_US",
  }) async {
    if (!_isInitialized) {
      await init();
    }

    await _speech.listen(
      localeId: localeId,
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }

  Future<void> cancelListening() async {
    await _speech.cancel();
  }

  Future<List<LocaleName>> getLocales() async {
    return await _speech.locales();
  }
}