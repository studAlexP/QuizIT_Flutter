import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/data/network/quiz_api_impl.dart';
import 'package:quiz_it_flutter/models/question.dart';
import 'package:quiz_it_flutter/utils/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/home/home_screen.dart';
import 'package:quiz_it_flutter/presentation/screens/result/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question>? questions;

  getData() async {
    questions = await QuizApiImpl().getQuestions(
        category: Settings.category,
        difficulty: Settings.difficulty,
        limit: Settings.limit);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return QuizPageContent(questions: questions);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading"),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class QuizPageContent extends StatefulWidget {
  final List<Question>? questions;

  const QuizPageContent({super.key, required this.questions});

  @override
  State<StatefulWidget> createState() => _QuizPageContentState();
}

class _QuizPageContentState extends State<QuizPageContent> {
  int currentQuestion = 0;
  List<bool> isAnswerCorrect = List<bool>.filled(6, false);

  void showAnswers() {
    setState(() {
      isAnswerCorrect = [
        widget.questions![currentQuestion].correctAnswers.answerACorrect ==
            "true",
        widget.questions![currentQuestion].correctAnswers.answerBCorrect ==
            "true",
        widget.questions![currentQuestion].correctAnswers.answerCCorrect ==
            "true",
        widget.questions![currentQuestion].correctAnswers.answerDCorrect ==
            "true",
        widget.questions![currentQuestion].correctAnswers.answerECorrect ==
            "true",
        widget.questions![currentQuestion].correctAnswers.answerFCorrect ==
            "true",
      ];
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestion += 1;
      isAnswerCorrect.fillRange(0, isAnswerCorrect.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.questions![currentQuestion].category),
        elevation: 3,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(widget.questions![currentQuestion].question,
                style: Theme.of(context).textTheme.displaySmall,)
                )
              )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            if (widget.questions![currentQuestion].answers.answerA != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerA,
                  isAnswerCorrect[0],
                  (value) => setState(() => isAnswerCorrect[0] = value)),
            const SizedBox(height: 10),
            if (widget.questions![currentQuestion].answers.answerB != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerB,
                  isAnswerCorrect[1],
                  (value) => setState(() => isAnswerCorrect[1] = value)),
            const SizedBox(height: 10),
            if (widget.questions![currentQuestion].answers.answerC != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerC,
                  isAnswerCorrect[2],
                  (value) => setState(() => isAnswerCorrect[2] = value)),
            const SizedBox(height: 10),
            if (widget.questions![currentQuestion].answers.answerD != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerD,
                  isAnswerCorrect[3],
                  (value) => setState(() => isAnswerCorrect[3] = value)),
            const SizedBox(height: 10),
            if (widget.questions![currentQuestion].answers.answerE != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerE,
                  isAnswerCorrect[4],
                  (value) => setState(() => isAnswerCorrect[4] = value)),
            const SizedBox(height: 10),
            if (widget.questions![currentQuestion].answers.answerF != null)
              _buildAnswerToggleButtons(
                  widget.questions![currentQuestion].answers.answerF,
                  isAnswerCorrect[5],
                  (value) => setState(() => isAnswerCorrect[5] = value)),
            const SizedBox(height: 10),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => showAnswers(),
              child: const Text("Show answers"),
            ),
            if (currentQuestion + 1 < widget.questions!.length)
              ElevatedButton(
                onPressed: () => nextQuestion(),
                child: const Text("Next"),
              )
            else
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResultPage()));
                  },
                  child: const Text("End"))
          ],
        )
      ]),
    );
  }

  Widget _buildAnswerToggleButtons(
      String answer, bool isSelected, ValueChanged<bool> onPressed) {
    return StatefulBuilder(builder: (context, setState) {
      return ToggleButtons(
        onPressed: (index) => onPressed(!isSelected),
        isSelected: [isSelected],
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(answer, style: Theme.of(context).textTheme.displaySmall,))],
      );
    });
  }
}
