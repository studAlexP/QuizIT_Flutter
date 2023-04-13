import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/domain/util/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/settings/settings_screen.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResultPageContent(),
    );
  }
}

class ResultPageContent extends StatelessWidget {
  const ResultPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text("Result", style: Theme.of(context).textTheme.titleLarge,)
          ),
          const SizedBox(height: 50),
          Text("Hey Congratulations!", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 100),
          Semantics(
            label: "Trophy",
            child: Image.network(
              'https://cdn.pixabay.com/photo/2017/01/28/11/43/cup-2015198_1280.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 100),
          Text(Settings.name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 50,),
          const FinishButton()
        ],
      ),
    );
  }
}

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsPage())
            );
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          child: const Text("Finish"),
        ),
    );
  }

}