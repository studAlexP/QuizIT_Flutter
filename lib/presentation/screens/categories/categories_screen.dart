import 'package:flutter/material.dart';
import 'package:quiz_it_flutter/domain/util/settings.dart';
import 'package:quiz_it_flutter/presentation/screens/quiz/quiz_screen.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesPageContent(),
    );
  }
}

class CategoriesPageContent extends StatelessWidget {
  const CategoriesPageContent({super.key});

  void _onCategoryClicked(BuildContext context, String category) {
    Settings.category = category;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const QuizPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Pick a category",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
        CategoryCard(
            categoryText: "Bash",
            onTap: () => _onCategoryClicked(context, "Bash")),
        CategoryCard(
            categoryText: "CMS",
            onTap: () => _onCategoryClicked(context, "CMS")),
        CategoryCard(
            categoryText: "Code",
            onTap: () => _onCategoryClicked(context, "Code")),
        CategoryCard(
            categoryText: "DevOps",
            onTap: () => _onCategoryClicked(context, "DevOps")),
        CategoryCard(
            categoryText: "Docker",
            onTap: () => _onCategoryClicked(context, "Docker")),
        CategoryCard(
            categoryText: "Linux",
            onTap: () => _onCategoryClicked(context, "Linux")),
        CategoryCard(
            categoryText: "SQL",
            onTap: () => _onCategoryClicked(context, "SQL")),
        CategoryCard(
            categoryText: "Uncategorized",
            onTap: () => _onCategoryClicked(context, "Uncategorized"))
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
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
