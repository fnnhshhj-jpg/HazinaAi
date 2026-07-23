import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  AIService._();

  static final AIService instance = AIService._();

  // API kalitini bu yerga yozing
  static const String apiKey = "YOUR_API_KEY";

  // OpenAI Chat Completions endpoint
  static const String baseUrl =
      "https://api.openai.com/v1/chat/completions";

  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey",
  };

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: _headers,
        body: jsonEncode({
          "model": "gpt-4.1-mini",
          "messages": [
            {
              "role": "user",
              "content": message,
            }
          ],
          "temperature": 0.7,
          "max_tokens": 1024,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data["choices"][0]["message"]["content"]
            .toString()
            .trim();
      } else {
        throw Exception(
          "API Error: ${response.statusCode}\n${response.body}",
        );
      }
    } catch (e) {
      return "Xatolik: $e";
    }
  }

  Future<String> translate({
    required String text,
    required String language,
  }) async {
    return sendMessage(
      "Translate the following text to $language:\n$text",
    );
  }

  Future<String> summarize(String text) async {
    return sendMessage(
      "Summarize the following text:\n$text",
    );
  }

  Future<String> writeArticle(String topic) async {
    return sendMessage(
      "Write a detailed article about: $topic",
    );
  }

  Future<String> grammarFix(String text) async {
    return sendMessage(
      "Correct grammar and spelling:\n$text",
    );
  }
}