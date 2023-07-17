import 'package:flutter/material.dart';
import '../components/category_components.dart';
import '../res/my_colors.dart';
import '../res/my_images.dart';
import '../res/my_strings.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  // Named Route
  static String id = "CategoriesPage";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kPrimaryColor,
      // AppBar
      appBar: AppBar(
        // Categories Page App Bar Title
        title: const Text(
          "Categories",
          style: TextStyle(
              color: Color(0xffF57D09),
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          // Logo Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppImages.kAppLogo,
              width: 55,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            AppImages.kOpeningBG,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: SizedBox(
              height: size.height / 3.5,
              width: size.width,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Hello  ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "MyFont",
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: AppStrings.kUserName,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 57, 159, 173),
                                  fontFamily: "Ubuntu",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: "Ready to test yourself ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "MyFont",
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: "?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 57, 159, 173),
                                fontFamily: "MyFont",
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Choose your Category:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "MyFont",
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: size.height * 1 / 8,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 210, 210, 210),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [
                      CategoryComp(
                        categoryName: "Sports",
                        categoryColor: Colors.green,
                        categoryIcon: Icons
                            .sports_soccer, 
                      ),
                      CategoryComp(
                        categoryName: "History",
                        categoryColor: Colors.deepPurple,
                        categoryIcon: Icons.book_outlined,
                      ),
                      CategoryComp(
                        categoryName: "Art",
                        categoryColor: Color.fromARGB(183, 54, 127, 244),
                        categoryIcon: Icons.art_track_outlined,
                      ),
                      CategoryComp(
                        categoryName: "Health",
                        categoryColor: Colors.orange,
                        categoryIcon: Icons.medical_information,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
