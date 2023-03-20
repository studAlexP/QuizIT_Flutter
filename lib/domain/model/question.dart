import 'dart:convert';

List<Question> questionFromJson(String str) => List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
    Question({
        required this.id,
        required this.question,
        this.description,
        required this.answers,
        required this.multipleCorrectAnswers,
        required this.correctAnswers,
        this.correctAnswer,
        this.explanation,
        this.tip,
        required this.tags,
        required this.category,
        required this.difficulty,
    });

    int id;
    String question;
    dynamic description;
    Answers answers;
    String multipleCorrectAnswers;
    CorrectAnswers correctAnswers;
    String? correctAnswer;
    String? explanation;
    dynamic tip;
    List<Tag> tags;
    String category;
    Difficulty difficulty;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        description: json["description"],
        answers: Answers.fromJson(json["answers"]),
        multipleCorrectAnswers: json["multiple_correct_answers"],
        correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
        correctAnswer: json["correct_answer"],
        explanation: json["explanation"],
        tip: json["tip"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        category: json["category"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "description": description,
        "answers": answers.toJson(),
        "multiple_correct_answers": multipleCorrectAnswers,
        "correct_answers": correctAnswers.toJson(),
        "correct_answer": correctAnswer,
        "explanation": explanation,
        "tip": tip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "category": category,
        "difficulty": difficultyValues.reverse[difficulty],
    };
}

class Answers {
    Answers({
        required this.answerA,
        required this.answerB,
        this.answerC,
        this.answerD,
        this.answerE,
        this.answerF,
    });

    String answerA;
    String answerB;
    String? answerC;
    String? answerD;
    dynamic answerE;
    dynamic answerF;

    factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        answerA: json["answer_a"],
        answerB: json["answer_b"],
        answerC: json["answer_c"],
        answerD: json["answer_d"],
        answerE: json["answer_e"],
        answerF: json["answer_f"],
    );

    Map<String, dynamic> toJson() => {
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
        "answer_e": answerE,
        "answer_f": answerF,
    };
}

class CorrectAnswers {
    CorrectAnswers({
        required this.answerACorrect,
        required this.answerBCorrect,
        required this.answerCCorrect,
        required this.answerDCorrect,
        required this.answerECorrect,
        required this.answerFCorrect,
    });

    String answerACorrect;
    String answerBCorrect;
    String answerCCorrect;
    String answerDCorrect;
    String answerECorrect;
    String answerFCorrect;

    factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
        answerACorrect: json["answer_a_correct"],
        answerBCorrect: json["answer_b_correct"],
        answerCCorrect: json["answer_c_correct"],
        answerDCorrect: json["answer_d_correct"],
        answerECorrect: json["answer_e_correct"],
        answerFCorrect: json["answer_f_correct"],
    );

    Map<String, dynamic> toJson() => {
        "answer_a_correct": answerACorrect,
        "answer_b_correct": answerBCorrect,
        "answer_c_correct": answerCCorrect,
        "answer_d_correct": answerDCorrect,
        "answer_e_correct": answerECorrect,
        "answer_f_correct": answerFCorrect,
    };
}

enum Difficulty { MEDIUM, HARD, EASY }

final difficultyValues = EnumValues({
    "Easy": Difficulty.EASY,
    "Hard": Difficulty.HARD,
    "Medium": Difficulty.MEDIUM
});

class Tag {
    Tag({
        required this.name,
    });

    String name;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
