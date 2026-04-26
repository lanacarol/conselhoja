import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  Future<String> translateToPortuguese(String text) async {
    final url = Uri.parse(
      'https://api.mymemory.translated.net/get?q=${Uri.encodeComponent(text)}&langpair=en|pt-br',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['responseData']['translatedText'];
    } else {
      throw Exception('Erro ao traduzir conselho');
    }
  }
}
