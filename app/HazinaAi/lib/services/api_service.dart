import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // API manzilingizni shu yerga yozing
  static const String baseUrl = "https://your-api-url.com";

  // GET so'rov
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    return _handleResponse(response);
  }

  // POST so'rov
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  // PUT so'rov
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse("$baseUrl$endpoint"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  // DELETE so'rov
  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse("$baseUrl$endpoint"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    return _handleResponse(response);
  }

  // Javobni tekshirish
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "API xatosi: ${response.statusCode}\n${response.body}",
      );
    }
  }
}