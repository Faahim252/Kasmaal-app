import 'package:flutter/material.dart';
import 'package:kasmaal/router/app_route.dart';
import 'package:kasmaal/services/api_service.dart';

import '../components/response_tile.dart';
import '../model/question_model.dart';

class GameProvider extends ChangeNotifier {
  int points = 0;
  int score = 0;
  bool canSelected = true;
  int index = 0;
  final List<GlobalKey<ResponseTileState>> responseTileKeys = [
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
  ];
  Question? currentQuestion;
  List<Question> questions = [];
  List<Question> questionsTest = [
    Question(
      id: 1,
      question: "the capital city of france ?",
      answerA: {"text": "Paris", "isCorrect": true},
      answerB: {"text": "Londres", "isCorrect": false},
      answerC: {"text": "Berlin", "isCorrect": false},
      answerD: {"text": "Madrid", "isCorrect": false},
    ),
    Question(
      id: 2,
      question: "The capital city of somaalia ?",
      answerA: {"text": "Baydhabo", "isCorrect": false},
      answerB: {"text": "Mogadishu", "isCorrect": true},
      answerC: {"text": "Marko", "isCorrect": false},
      answerD: {"text": "Afgoi", "isCorrect": false},
    ),
    Question(
      id: 3,
      question: "somaalia located in ?",
      answerA: {"text": "East Africa", "isCorrect": true},
      answerB: {"text": "west Africa", "isCorrect": false},
      answerC: {"text": "Africa", "isCorrect": false},
      answerD: {"text": "SOUTH Africa", "isCorrect": false},
    ),
    Question(
      id: 4,
      question: "my developer name is ?",
      answerA: {"text": "abdi", "isCorrect": false},
      answerB: {"text": "Abdirahman sayidali", "isCorrect": true},
      answerC: {"text": "faahim", "isCorrect": false},
      answerD: {"text": "rahmaani", "isCorrect": false},
    ),
    Question(
      id: 5,
      question: "water symbol ?",
      answerA: {"text": "H2O", "isCorrect": true},
      answerB: {"text": "O2", "isCorrect": false},
      answerC: {"text": "CO2", "isCorrect": false},
      answerD: {"text": "NH3", "isCorrect": false},
    ),
    Question(
      id: 6,
      question: "president of America ?",
      answerA: {"text": "Barack Obama", "isCorrect": false},
      answerB: {"text": "Joe Biden", "isCorrect": true},
      answerC: {"text": "Donald Trump", "isCorrect": false},
      answerD: {"text": "George W. Bush", "isCorrect": false},
    ),
    Question(
      id: 7,
      question: "somaalia prime minister is ?",
      answerA: {"text": "faarah", "isCorrect": false},
      answerB: {"text": "geedi", "isCorrect": false},
      answerC: {"text": "Hamze", "isCorrect": true},
      answerD: {"text": "Abdirahman", "isCorrect": false},
    ),
    Question(
      id: 8,
      question: "capital city of shabeelada hoose region is ?",
      answerA: {"text": "afgoi", "isCorrect": false},
      answerB: {"text": "awdheegle", "isCorrect": false},
      answerC: {"text": "Marko", "isCorrect": true},
      answerD: {"text": "baydhabo", "isCorrect": false},
    ),
    Question(
      id: 9,
      question: "The world geniusest man is?",
      answerA: {"text": "Isaac Newton", "isCorrect": false},
      answerB: {"text": "Galilée", "isCorrect": false},
      answerC: {"text": "Albert Einstein", "isCorrect": true},
      answerD: {"text": "Marie Curie", "isCorrect": false},
    ),
    Question(
      id: 10,
      question: "somaalian man called is  ?",
      answerA: {"text": "rag", "isCorrect": true},
      answerB: {"text": "Gabar", "isCorrect": false},
      answerC: {"text": "naag", "isCorrect": false},
      answerD: {"text": "wiilal", "isCorrect": false},
    ),
  ];

  Future<void> init({required String categorie}) async {
    questions = await ApiService.getQuestionByCaterory(categorie) ??
        await ApiService.getRandomQuestion() ??
        questionsTest;
    score = 0;
    canSelected = true;
    index = 0;
    currentQuestion = questions[index];
  }

  void nextQuestion({required BuildContext context}) {
    if (index < 9) {
      canSelected = true;
      for (var element in responseTileKeys) {
        element.currentState!.init();
      }
      if (index < questions.length) {
        index++;
        currentQuestion = questions[index];
        notifyListeners();
      }
    } else if (index == 9) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.scorePage, (route) => false,
          arguments: score);
    }
  }

  void corrector() {
    for (var element in responseTileKeys) {
      element.currentState!.correction();
    }
    notifyListeners();
  }

  void playAgain({required BuildContext context}) {
    score = 0;
    canSelected = true;
    index = 0;
    currentQuestion = questions[index];
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoute.quizPage, (route) => false);
  }

  void addScore() {
    score++;
    notifyListeners();
  }
}
