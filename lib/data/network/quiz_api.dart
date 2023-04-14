import 'package:quiz_it_flutter/models/question.dart';

abstract class QuizApi {

  Future<List<Question>> getQuestions({
    required String category,
    required String difficulty,
    required String limit
  });
}