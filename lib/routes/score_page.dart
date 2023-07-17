import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/score_container.dart';
import '../res/my_colors.dart';
import '../res/my_images.dart';
import '../res/my_strings.dart';
import 'categories_page.dart';
import 'opening_page.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    super.key,
    required this.result,
  });
  final int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.kOpeningBG), fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(
                  flex: 1,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi ',
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.kMyWhite,
                        fontFamily: "MyFont"),
                    children: <TextSpan>[
                      // UserName
                      TextSpan(
                        text: '${AppStrings.kUserName},',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                          fontSize: 20,
                          color: Color.fromARGB(255, 57, 159, 173),
                        ),
                      ),
                      const TextSpan(
                        text: '\nyour Score is ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 183, 255, 0),
                            fontSize: 20,
                            fontFamily: "Ubuntu"),
                      ),
                      // Result in points
                      TextSpan(
                        text: "${result}pt",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "MyFont",
                          fontSize: 20,
                          color: Color.fromARGB(255, 57, 159, 173),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(
                  flex: 2,
                ),
                // Play again btn
                ScoreBtn(
                  btnName: "Play Again ?",
                  btnColor: Colors.blue,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, CategoriesPage.id);
                  },
                  withIcon: true,
                ),
                // Reset btn
                ScoreBtn(
                  btnName: "Reset",
                  btnColor: Colors.amber,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, OpeningPage.id);
                  },
                  withIcon: false,
                ),

                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Quit btn
                    InkWell(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.kQuit,
                            color: Colors.white,
                          ),
                          const Text(
                            "Quit",
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
