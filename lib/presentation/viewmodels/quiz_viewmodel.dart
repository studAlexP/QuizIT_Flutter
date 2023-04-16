import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/data/network/quiz_api_impl.dart';
import 'package:quiz_it_flutter/models/question.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizApiImpl _quizApiImpl = QuizApiImpl();

  List<Question>? _questions;

  List<Question>? get questions => _questions;

  getQuestions({required String category, required String difficulty, required String limit}) async {
    _questions = await _quizApiImpl.getQuestions(category: category, difficulty: difficulty, limit: limit);
    notifyListeners();
  }
}