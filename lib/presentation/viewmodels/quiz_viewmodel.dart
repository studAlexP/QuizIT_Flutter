import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/services/quiz_api.dart';
import 'package:quiz_it_flutter/models/question.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizApi _quizApi = QuizApi();

  List<Question>? _questions;

  List<Question>? get questions => _questions;

  getQuestions({required String category, required String difficulty, required String limit}) async {
    _questions = await _quizApi.getQuestions(category: category, difficulty: difficulty, limit: limit);
    notifyListeners();
  }
}