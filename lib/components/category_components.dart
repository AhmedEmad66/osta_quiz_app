import 'package:flutter/material.dart';

import '../data/art_questions.dart';
import '../data/health_questions.dart';
import '../data/history_questions.dart';
import '../data/sports_questions_list.dart';
import '../res/my_colors.dart';
import '../routes/test_page.dart';

class CategoryComp extends StatelessWidget {
  const CategoryComp({
    super.key,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryIcon,
  });
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TestPage(
                      testCategoryName: categoryName,
                      categoryColor: categoryColor,
                      questions: categoryName == "Sports"
                          ? sportsQuestions
                          : categoryName == "History"
                              ? historyQuestions
                          : categoryName == "Art"
                              ? artQuestions
                              : healthQuestions,
                    )));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: categoryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                categoryIcon,
                size: 50,
                color: const Color.fromARGB(255, 255, 255, 255) ,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu",
                  color: AppColors.kMyWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
