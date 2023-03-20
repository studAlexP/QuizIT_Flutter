import 'package:quiz_it_flutter/domain/model/question.dart';

abstract class QuizApi {

  Future<List<Question>> getQuestions({
    required String category,
    required String difficulty,
    required String limit
  });
}