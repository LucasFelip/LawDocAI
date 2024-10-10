import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = const String.fromEnvironment('OPENAI_API_KEY');

  Future<Map<String, dynamic>> generateAnalysis(String fileContent, String tribunal) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    fileContent = truncateText(fileContent, 3000);

    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          'role': 'system',
          'content': 'Você é um especialista jurídico que analisa documentos legais.'
        },
        {
          'role': 'user',
          'content': 'Por favor, resuma e analise o seguinte documento jurídico do tribunal $tribunal: $fileContent'
        }
      ],
      'max_tokens': 50,
    });

    print(body);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Erro: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to generate analysis from OpenAI');
    }
  }

  String truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return text.substring(0, maxLength);
    } else {
      return text;
    }
  }
}