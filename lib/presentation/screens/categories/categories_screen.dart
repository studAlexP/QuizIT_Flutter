import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/domain/util/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/quiz/quiz_screen.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesPageContent(),
    );
  }
}

class CategoriesPageContent extends StatelessWidget {
  CategoriesPageContent({super.key});

  final List<String> categories = [
    "Bash",
    "CMS",
    "Code",
    "DevOps",
    "Docker",
    "Linux",
    "SQL",
    "Uncategorized"
  ];

  void _onCategoryClicked(BuildContext context, String category) {
    Settings.category = category;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const QuizPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Pick a category",
          style: Theme.of(context).textTheme.titleMedium,
          ),
        )),
        ...categories.map(
          (categoryText) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CategoryCard(
              categoryText: categoryText,
              onTap: () => _onCategoryClicked(context, categoryText),
            ),
          )
        ).toList()
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryText;
  final VoidCallback onTap;
  const CategoryCard(
      {super.key, required this.categoryText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: InkWell(
            onTap: () {
              Settings.category = categoryText;
              onTap();
            },
              child: Center(
                  child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          categoryText,
                          style: Theme.of(context).textTheme.titleSmall
                        ),
                      )),
                ),
              ),
          ),
      ],
    );
  }
}
