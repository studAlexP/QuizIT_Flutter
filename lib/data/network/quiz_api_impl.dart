import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_it_flutter/data/network/quiz_api.dart';
import 'package:quiz_it_flutter/models/question.dart';

class QuizApiImpl extends QuizApi {
  
  @override
  Future<List<Question>> getQuestions({
    required String category,
    required String difficulty,
    required String limit
    }) async {

      try {
        final queryParameters = {
        'apiKey' : dotenv.env['apiKey'],
        'category': category,
        'difficulyty': difficulty,
        'limit': limit
        };

        var url = Uri.https("www.quizapi.io", "api/v1/questions", queryParameters);
        var response = await http.get(url);

        return questionFromJson(response.body);
      } on Exception catch(e) {
        throw Exception(e.toString());
      } 
  }

}