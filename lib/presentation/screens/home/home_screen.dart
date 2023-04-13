import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/domain/util/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/settings/settings_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Welcome to QuizIT",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  )
                ),
            ],
          ),
          const SizedBox(height: 150,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                child: Text(
                  "Please enter your name:",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  )
                ),
            ],
          ),
          const NameButtonField(),
        ]
        ),
    );
  }
}

class NameButtonField extends StatefulWidget {
  const NameButtonField ({super.key});

  @override
  State<NameButtonField> createState () => _NameButtonField();
}

class _NameButtonField extends State<NameButtonField> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Name",
            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              Settings.name = textController.text;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                )
              );
            }, 
            child: const Text("Submit")),
        )
      ],
    );
  }
}