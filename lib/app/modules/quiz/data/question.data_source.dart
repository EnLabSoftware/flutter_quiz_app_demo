import 'package:http/http.dart' as http;

class QuestionDataSource {
  Future<http.Response> getQuestions() async {
    return await http
        .get(Uri.parse('https://the-trivia-api.com/api/questions?limit=5'));
  }
}
