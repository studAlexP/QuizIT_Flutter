import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/domain/util/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/home/home_screen.dart';
import 'package:quiz_it_flutter/presentation/screens/quiz/quiz_screen.dart';
import 'package:quiz_it_flutter/presentation/screens/settings/settings_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartPageContent(),
    );
  }
}

class StartPageContent extends StatelessWidget {
  const StartPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You will have",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${Settings.limit} - ${Settings.difficulty}",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Questions",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 200,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [StartButton()],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [SettingsButton()],
          )
        ],
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuizPage()));
          },
          child: Text(
            "Start",
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}
