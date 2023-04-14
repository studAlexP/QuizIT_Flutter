import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/utils/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/categories/categories_screen.dart';
import 'package:quiz_it_flutter/presentation/screens/start/start_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsPageContent(),
    );
  }
}

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CategoryButton(),
                SizedBox(width: 10),
                RandomButton()
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            const QuestionsSlider(),
            const DifficultySlider(),
          ],
        ));
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CategoriesPage()));
          },
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}

class RandomButton extends StatelessWidget {
  const RandomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const StartPage()));
          },
          child: Text(
            "Random",
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}

class QuestionsSlider extends StatefulWidget {
  const QuestionsSlider({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionsSliderState();
}

class _QuestionsSliderState extends State<QuestionsSlider> {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Slider(
                value: _currentSliderValue,
                min: 5,
                max: 20,
                divisions: 3,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                  Settings.limit = _currentSliderValue.round().toString();
                },
              ),
            ),
          ],
        ),
        Text("Number of questions: ${_currentSliderValue.round()}")
      ],
    );
  }
}

class DifficultySlider extends StatefulWidget {
  const DifficultySlider({super.key});

  @override
  State<StatefulWidget> createState() => _DifficultySliderState();
}

class _DifficultySliderState extends State<DifficultySlider> {
  double _value = 0;

  String getDifficulty(double value) {
    if (value == 0) {
      return "Easy";
    }
    if (value == 1) {
      return "Medium";
    }
    if (value == 2) {
      return "Hard";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Slider(
                min: 0,
                max: 2,
                divisions: 2,
                value: _value,
                label: Settings.difficulty,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                  Settings.difficulty = getDifficulty(_value);
                },
              ),
            ),
          ],
        ),
        Text("Difficulty: ${Settings.difficulty}")
      ],
    );
  }
}
